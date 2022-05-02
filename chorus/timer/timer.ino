#define CLOCK_OUTPUT_PIN 1 // device pin 6
#define LFO_OUTPUT_PIN 0   // device pin 5
#define RATE_IN A2         // Device pin 3
#define DEPTH_IN A3        // Device pin 2

uint8_t lfo_depth = 188;
uint8_t lfo_rate = 128;

uint32_t start = 0;
uint32_t mils = 0;
bool up = true;

void setup() {
  pinMode(CLOCK_OUTPUT_PIN, OUTPUT);
  pinMode(LFO_OUTPUT_PIN, OUTPUT);
  pinMode(RATE_IN, INPUT);
  pinMode(DEPTH_IN, INPUT);

  noInterrupts();
  // Timer0 configuration:
  // Timer mode=5, prescale 8, phase-correct PWM which switches direction at OCR0A
  // OCR0B set to half of OCR0A to get duty cycle 50%
  // OUTPUT_PIN changes when OCR0B is passed
  TCCR0A = 0x00;
  TCCR0A |= (1<<WGM00) | (0<<WGM01) | (0<<COM0A1) | (1<<COM0B1) | (0<<COM0A0) | (1<<COM0B0);
  TCCR0B = 0x00;
  TCCR0B |= (1<<WGM02) | (1<<CS01);
  TCNT0 = 0; // Reset clock

  // NOTE: because we're using timer0, we break millis/micros.
  // So we re-enable a similar function using timer1.
  // an interrupt is set at 1KHz and increments a unt32_t mils counter.
  OCR1C = 124;            // 1000 Hz (16000000/((124+1)*128))
  OCR1A = OCR1C;          // interrupt COMPA
  TCCR1 |= (1 << CTC1);   // CTC
  TCCR1 |= (1 << CS12) | (1 << CS11) | (1 << CS10);
  TIMSK |= (1 << OCIE1A); // Output Compare Match A Interrupt Enable
  TCNT1 = 0;

  setOutputClock(0);
  
  interrupts();
}

ISR(TIMER1_COMPA_vect) {
  mils++;
}

void loop() {
  uint32_t t = mils;
  if (start > t) {
    // rollover detected, happens ~50 days
    start = mils;
    return;
  }
  uint32_t target = start + getLFOPeriod(lfo_rate);
  if (t >= target) {
    start = mils;
    up = !up; // switch direction
    digitalWrite(LFO_OUTPUT_PIN, up ? LOW : HIGH); // use this to measure LFO frequency
    return;
  }
  lfo_rate = (uint8_t) (analogRead(RATE_IN) / 4);
  lfo_depth = (uint8_t) (analogRead(DEPTH_IN) / 4);

  uint32_t v = up ? t : (target - t + start);
  uint8_t rate = (uint8_t) map(v, start, target, 0, lfo_depth);
  setOutputClock(rate);
}

void setOutputClock(uint8_t v) {
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
  31075, 29063, 27181, 25421, 23775, 22236, 20796, 19449, 
  18190, 17012, 15911, 14880, 13917, 13016, 12173, 11385, 
  10647,  9958,  9313,  8710,  8146,  7619,  7125,  6664, 
   6232,  5829,  5452,  5099,  4768,  4460,  4171,  3901, 
   3648,  3412,  3191,  2984,  2791,  2610,  2441,  2283, 
   2135,  1997,  1868,  1747,  1634,  1528,  1429,  1337, 
   1250,  1169,  1093,  1023,   956,   894,   837,   782, 
    732,   684,   640,   599,   560,   524,   490,   458,
};

uint32_t getLFOPeriod(uint8_t rate) {
  // algorithm determined heuristically.
  // this floating point math would be way too
  // slow to calculate on device, so instead
  // we precalculated the results in progmem.
  // round(1/(1.25^(0.3*(rate/4) - 15.4)))
  // picked a resolution of 64 as it seems like a good balance of control and memory
  // / 2 to account for half periods to switch directions
  uint16_t period = pgm_read_word_near(LFO_PERIODS + (rate / 4));
  return (uint32_t) period;
}
