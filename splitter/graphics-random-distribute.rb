
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
def linear_probability(value, bound_start, bound_end)
    raise ArgumentError if bound_end < bound_start

    return 0 if value < bound_start
    return 1 if value > bound_end
    (value - bound_start) / (bound_end - bound_start).to_f
end

CircularAvoid = Struct.new(:center, :radius, :give) do 
    def probability_weight(coords)
        distance = coords.distance_to(center)
        linear_probability(distance, radius, radius + give)
    end
end

RectangleAvoid = Struct.new(:start_x, :start_y, :width, :height, :give) do
    def end_x; start_x + width; end

    def end_y; start_y + height; end

    def distance_from_edge(coords)
        # https://stackoverflow.com/a/30545544
        x, y = coords
        d_x = [start_x - x, x - end_x].max
        d_y = [start_y - y, y - end_y].max
        return [d_x, d_y].max if d_x.negative? && d_y.negative?
        return Math.sqrt(d_x**2 + d_y**2) if d_x.positive? && d_y.positive?
        [d_x, d_y].max
    end

    def probability_weight(coords)
        linear_probability(distance_from_edge(coords), 0, give)
    end
end

class EdgeAvoid < RectangleAvoid
    def initialize(width, height, give)
        super(give, give, width - 2*give, height - 2*give, give)
    end

    def probability_weight(coords)
        1 - super(coords)
    end
end

class ProbabilitySpace
    attr_reader :width, :height
    
    def initialize(width, height, random_inst = nil)
        @width = width
        @height = height
        @components = []
        @rand = random_inst || Random.new
    end

    def add(component)
        @components << component
    end

    def weight(coords)
        return 1.0 if @components.empty?

        @components.map { |c| c.probability_weight(coords) }.reduce(:*)
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

    def random_location
        # http://www.gatsby.ucl.ac.uk/~porbanz/teaching/GR8201S17/slides_sampling.pdf
        start_x, start_y, end_x, end_y = bounds
        loop do
            z, y = yield
            z = @rand.rand
            return [x, y] if z <= weight([x, y])
        end
    end

    # This implementation uses Poisson disc sampling, but accounting for the weights in our probability space
    def sample(count, radius, min_dist, k = 30)
        # https://www.jasondavies.com/poisson-disc/
        # https://www.cs.ubc.ca/~rbridson/docs/bridson-siggraph07-poissondisk.pdf
        added = []
        active = []
        # Add a random location to start
        active << random_location do
            x = @rand.rand(0..(width-radius))
            y = @rand.rand(0..(height-radius))
            [x, y]
        end
        while added.count < count
            # pick a random element from the active list
            test = active.sample

            p = random_location do
                # generate a random point between r and 2r from the test point
                rand_angle = @rand.rand(0..(2*Math::PI))
                r = radius + min_dist
                rand_radius = @rand.rand(r...(2*r))
                x = rand_radius * Math.cos(rand_angle)
                y = rand_radius * Math.sin(rand_angle)
                [x, y]
            end
            if added.any? do |added_point|
                added_point
            end
        end
    end

    def display(scale)
        (0...height).step(scale).map do |y|
            (0...width).step(scale).map do |x|
                prob_to_char(weight([x, y]))
            end.join
        end.join("\n")
    end

    def prob_to_char(prob)
        [' ', '░', '▒', '▓', '█'][(prob*4).round]
    end
end

width = 62
height = 117

critter_count = 14
critter_radius = 8

ps = ProbabilitySpace.new(width, height)
ps.add(EdgeAvoid.new(width, height, 5)) # case bounds
ps.add(CircularAvoid.new(25+6, 86.5+6, 12, 4)) # stompswitch
ps.add(RectangleAvoid.new(17.888, 108.503, 26.224, 6.549, 3)) # rabid.audio logo
ps.add(RectangleAvoid.new(10, 19.375, 42, 15.956, 3)) # knobs and switch
ps.add(CircularAvoid.new(28.25, 34.5, 5.5, 2)) # LED

# critter_count.times do |i|
#     x, y = ps.sample(critter_radius, 1)
#     ps.add(CircularAvoid.new(x, y, critter_radius - 4, 10)) # add it so the critters don't stack on each other
#     puts "#{i}\t#{x}\t#{y}"
# end
# puts ps.display(2)
