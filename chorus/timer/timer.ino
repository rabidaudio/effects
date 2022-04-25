
uint8_t lfo_depth = 188;
uint8_t lfo_rate = 190;

uint64_t start = 0;
bool up = true;
uint8_t timer_compare = 0;

void setup() {
  Serial.begin(9600);
  start = millis();
  // put your setup code here, to run once:

  // TIMER1_COMPA
  //  TCNT0
  // OCR0A and OCR0B compare registers

  // OC0A and OC0B output compare pins (pg 69)

  //  TCCR0B set clock source and prescaler
}

void loop() {
  uint64_t t = micros();
  uint64_t target = start + getLFOPeriod(lfo_rate);
  if (start > t) {
    // rollover detected
    start = micros();
    return;
  }
  if (t >= target) {
    start = micros();
    up = !up; // switch direction
    return;
  }
  // read lfo_rate
  // read lfo_depth

  // lfo_depth / 2 to map 256 to 128 resolution (directly settable as timer compare values)
  // gate timer to accepted values (200KHz to 10KHz)
  uint64_t v = up ? t : (target - t + start);
  timer_compare = (uint8_t) constrain(map(v, start, target, 0, (lfo_depth / 2)-4), 0, 99-4);
  Serial.println(timer_compare);
}

const PROGMEM uint16_t LFO_PERIODS[] = {
  30347, 28382, 26544, 24825, 23218, 21714, 20308, 18993, 
  17764, 16613, 15538, 14532, 13591, 12711, 11888, 11118, 
  10398,  9725,  9095,  8506,  7955,  7440,  6958,  6508,
   6086,  5692,  5324,  4979,  4657,  4355,  4073,  3809,
   3563,  3332,  3116,  2914,  2726,  2549,  2384,  2230,
   2085,  1950,  1824,  1706,  1596,  1492,  1396,  1305,
   1221,  1142,  1068,   999,   934,   873,   817,   764,
    715,   668,   625,   585,   547,   511,   478,   447,    
};

uint64_t getLFOPeriod(uint8_t rate) {
  // algorithm determined heuristically.
  // this floating point math would be way too
  // slow to calculate on device, so instead
  // we precalculated the results in progmem.
  // round(1/(1.25^(0.3*(rate/4) - 15.4)))
  // picked a resolution of 64 as it seems like a good balance of control and memory
  // * 1024 to convert ms to us (1024 is faster than 1000; we've scaled for discrepeancy in values)
  // / 2 to account for half periods to switch directions
  uint16_t period = pgm_read_word_near(LFO_PERIODS + (rate / 4));
  return ((uint64_t) period) * 1024 / 2;
}
