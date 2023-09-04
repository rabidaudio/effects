Vec2 = Struct.new(:x, :y) do
    def self.from_polar(angle, radius)
        x = radius * Math.cos(angle)
        y = radius * Math.sin(angle)
        new(x, y)
    end

    def self.origin
        new(0, 0)
    end

    def distance_to(other_vect)
        Math.sqrt((x - other_vect.x)**2 + (y - other_vect.y)**2)
    end

    def +(other)
        return Vec2.new(x + other.x, y + other.y) if other.is_a?(Vec2)
        
        Vec2.new(x + other, y + other)
    end

    def -(other)
        return Vec2.new(x - other.x, y - other.y) if other.is_a?(Vec2)
        
        Vec2.new(x - other, y - other)
    end
end

# TODO: this is linear, should we use exponential instead?
def probability_gradient(value, bound_start, bound_end)
    raise ArgumentError if bound_end < bound_start

    return 0 if value < bound_start
    return 1 if value > bound_end
    (value - bound_start) / (bound_end - bound_start).to_f
end

CircularAvoid = Struct.new(:center, :radius, :give) do 
    def probability_weight(coords)
        distance = coords.distance_to(center)
        probability_gradient(distance, radius, radius + give)
    end
end

RectangleAvoid = Struct.new(:top_left, :size, :give) do
    def bottom_right; top_left + size; end

    def distance_from_edge(coords)
        # https://stackoverflow.com/a/30545544
        d_x = [top_left.x - coords.x, coords.x - bottom_right.x].max
        d_y = [top_left.y - coords.y, coords.y - bottom_right.y].max
        return [d_x, d_y].max if d_x.negative? && d_y.negative?
        return Vec2.new(d_x, d_y).distance_to(Vec2.origin) if d_x.positive? && d_y.positive?
        [d_x, d_y].max
    end

    def probability_weight(coords)
        probability_gradient(distance_from_edge(coords), 0, give)
    end
end

class EdgeAvoid < RectangleAvoid
    def initialize(size, give)
        super(Vec2.origin + give, size - 2*give, give)
    end

    def probability_weight(coords)
        1 - super(coords)
    end
end

class ProbabilitySpace
    def initialize(size, random_inst = nil)
        @size = size
        @components = []
        @rand = random_inst || Random.new
    end

    def add(component)
        @components << component
    end

    def weight(coords, radius = nil)
        return 1.0 if @components.empty?

        if radius.nil?
            return @components.map { |c| c.probability_weight(coords) }.reduce(:*)
        end


        # if a radius is given, multiply the center by the
        # weighted average of 8 points around the circle
        points = (0..(2*Math::PI)).step(8).map do |angle|
            coords + Vec2.from_polar(angle, radius)
        end
        avg = points.map { |p| weight(p, nil) }.reduce(:+) / 8.0
        weight(coords, nil) * avg
    end

    # Using this on a loop to select coordinates and add them to the list
    # is a working but inefficient and nieve implementation. The distributions
    # it generates aren't uniform so they feel weird.
    # def sample(radius, step = 1)
    #     all_locations = (0..(width-radius)).step(step).to_a.product((0..(height-radius)).step(step).to_a)
    #     weights = all_locations.to_h { |coords| [coords, weight(coords)] }
    #     max = weights.values.sum
    #     cdf = cumulative_density(weights)
    #     v = @rand.rand(max)
    #     coord, _ = cdf.find { |coord, prob| prob > v }
    #     coord
    # end
    # def cumulative_density(weights)
    #     acc = 0
    #     weights.transform_values { |v| acc += v }
    # end

    # Select a random location weighted by the probability distribution.
    # If a block is given that returns an evenly-distributed random point in an area,
    # will weight selection within that space
    def random_location(radius = nil)
        # http://www.gatsby.ucl.ac.uk/~porbanz/teaching/GR8201S17/slides_sampling.pdf
        loop do
            if block_given?
                point = yield
            else
                point = Vec2.new(@rand.rand(0..@size.x), @rand.rand(0..@size.y))
            end
            z = @rand.rand
            return point if z <= weight(point, radius)
        end
    end

    # This implementation uses Poisson disc sampling, but accounting for the weights in our probability space
    def sample(count, obj_radius, min_dist, k = 30)
        # https://www.jasondavies.com/poisson-disc/
        # https://www.cs.ubc.ca/~rbridson/docs/bridson-siggraph07-poissondisk.pdf
        r = obj_radius + min_dist

        added = []
        active = []
        while added.count < count
            if active.empty?
                # Add a random location to start
                active << random_location do
                    x = @rand.rand(obj_radius..(@size.x-obj_radius))
                    y = @rand.rand(obj_radius..(@size.y-obj_radius))
                    Vec2.new(x, y)
                end
            end
            # pick a random element from the active list
            test = active.sample
            i = 0
            loop do
                p = random_location(obj_radius) do
                    # generate a random point between r and 2r from the test point
                    ra = @rand.rand(0..(2*Math::PI))
                    rr = @rand.rand(r...(2*r))
                    test + Vec2.from_polar(ra, rr)
                end
                too_close = added.any? do |added_point|
                    p.distance_to(added_point) < r
                end
                # try up to k times per test
                if too_close
                    i += 1
                    if i >= k
                        # if k attempts are exausted, skip test and pick another
                        active = active - [test]
                        break
                    end
                else
                    # if one is found, add it and pick a new test
                    added << p
                    active << p
                    break
                end
            end
        end
        added
    end

    def display(scale, things, thing_radius)
        (0...@size.y).step(scale).map do |y|
            (0...@size.x).step(scale).map do |x|
                v = Vec2.new(x, y)
                if things.any? { |thing| thing.distance_to(v) < thing_radius }
                    'x'
                else
                    prob_to_char(weight(v))
                end
            end.join
        end.join("\n")
    end

    def prob_to_char(prob)
        [' ', '░', '▒', '▓', '█'][(prob*4).round]
    end
end

width = 62
height = 117
bounds = Vec2.new(width, height)

critter_count = 14
critter_radius = 3
give = 10

ps = ProbabilitySpace.new(bounds)
ps.add(EdgeAvoid.new(bounds, 5)) # case bounds
# ps.add(CircularAvoid.new(Vec2.new(25+6, 86.5+6), 12, give)) # stompswitch
ps.add(RectangleAvoid.new(Vec2.new(17.888, 108.503), Vec2.new(26.224, 6.549), give)) # rabid.audio logo
ps.add(RectangleAvoid.new(Vec2.new(10, 19.375), Vec2.new(42, 15.956), give)) # knobs and switch
# ps.add(CircularAvoid.new(Vec2.new(28.25, 34.5), 5.5, give)) # LED

critters = ps.sample(critter_count, critter_radius, 10)
critters.each_with_index do |p, i|
    puts "#{i}\t#{p.x.round(2).to_s.rjust(6)}\t#{p.y.round(2).to_s.rjust(6)}"
end
puts ps.display(2, critters, critter_radius)
