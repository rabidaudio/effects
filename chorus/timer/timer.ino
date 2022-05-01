#define CLOCK_OUTPUT_PIN 1
#define LFO_OUTPUT_PIN 0
#define RATE_IN A2
#define DEPTH_IN A3

uint8_t lfo_depth = 188;
uint8_t lfo_rate = 128;

uint64_t start = 0;
bool up = true;

void setup() {
  // Serial.begin(9600);
  pinMode(CLOCK_OUTPUT_PIN, OUTPUT);
  pinMode(LFO_OUTPUT_PIN, OUTPUT);

  // Timer0 configuration:
  // Timer mode=5, prescale 8, phase-correct PWM which switches direction at OCR0A
  // OCR0B set to half of OCR0A to get duty cycle 50%
  // OUTPUT_PIN changes when OCR0B is passed
  TCCR0A = 0x00;
  TCCR0A |= (1<<WGM00) | (0<<WGM01) | (0<<COM0A1) | (1<<COM0B1) | (0<<COM0A0) | (1<<COM0B0);
  TCCR0B = 0x00;
  TCCR0B |= (1<<WGM02) | (1<<CS01);
  TCNT0 = 0; // Reset clock

  setClock(0);
  
  start = millis();
}

void loop() {
//  lfo_rate = (uint8_t) (analogRead(RATE_IN) / 4);
//  setClock(lfo_rate);
  
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
    digitalWrite(LFO_OUTPUT_PIN, up ? LOW : HIGH); // use this to measure frequency
    return;
  }
  lfo_rate = (uint8_t) (analogRead(RATE_IN) / 4);
  lfo_depth = (uint8_t) (analogRead(DEPTH_IN) / 4);

  uint64_t v = up ? t : (target - t + start);
  uint8_t rate = (uint8_t) map(v, start, target, 0, lfo_depth);
  setClock(rate);
}

void setClock(uint8_t v) {
  // output frequency range: 10KHz to 200KHz (limits of BBD)
  // because we need 50% duty cycle, OCR0B controls resolution.
  // at 16MHz clock with 8 prescaler, ouput frequency is
  // (16_000_000)/8/OCR0B
  // OCR0B in a range of [3, 50] gives proper output.
  // NOTE: mode 5 is somewhat resilient to
  // timer reconfiguration, as these values
  // are buffered and changed when the timer reaches 0.
  // we're changing two values which should take at least
  // 2 clock cycles, but with a prescaler of 8 we should have
  // 8 clock cycles so maybe there's no problem here.

  uint8_t value = map(v, 0, 255, 3, 50);
  OCR0A = value * 2;
  OCR0B = value;
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
