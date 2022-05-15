#define LFO_OUTPUT_PIN 12
#define RATE_IN A2
#define DEPTH_IN A3

uint8_t lfo_rate = 128;
uint8_t lfo_depth = 255;

uint32_t start = 0;
bool up = true;

void setup() {
  pinMode(LFO_OUTPUT_PIN, OUTPUT);
  pinMode(RATE_IN, INPUT);
  pinMode(DEPTH_IN, INPUT);
//  Serial.begin(9600);
}

void loop() {
  uint32_t t = millis();
  if (start > t) {
    // rollover detected, happens ~50 days
    start = millis();
    return;
  }
  uint32_t target = start + getLFOPeriod(lfo_rate);
  if (t >= target) {
    start = millis();
    up = !up; // switch direction
    return;
  }
  lfo_rate = (uint8_t) (analogRead(RATE_IN) / 4);
  lfo_depth = (uint8_t) (analogRead(DEPTH_IN) / 4);
//  Serial.println(lfo_rate);

  uint32_t v = up ? t : (target - t + start);
  uint8_t rate = (uint8_t) map(v, start, target, 0, lfo_depth);

  analogWrite(LFO_OUTPUT_PIN, rate);
}


// TODO: tweak values, increase resolution
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
  return (uint32_t) period / 2;
}
