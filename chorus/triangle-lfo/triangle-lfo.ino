#define LFO_OUTPUT_PIN 0 // device pin 5
#define RATE_IN A2 // device pin 3
#define DEPTH_IN A3 // device pin 2

uint8_t lfo_rate = 128;
uint8_t lfo_depth = 255;

uint32_t start = 0;
bool up = true;

const uint16_t minimum = 92; // 1.8/5*256

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
  rate = map(rate, 0, 255, 255, minimum);

  analogWrite(LFO_OUTPUT_PIN, rate);
}


const PROGMEM uint16_t LFO_PERIODS[] = {
15538,  15280,  15026,  14777,  14532,  14290,  14053,  13820,
13591,  13365,  13143,  12925,  12711,  12500,  12292,  12088,
11888,  11690,  11496,  11305,  11118,  10933,  10752,  10573,
10398,  10225,  10056,   9889,   9725,   9563,   9405,   9248,
 9095,   8944,   8796,   8650,   8506,   8365,   8226,   8090,
 7955,   7823,   7693,   7566,   7440,   7317,   7195,   7076,
 6958,   6843,   6729,   6618,   6508,   6400,   6294,   6189,
 6086,   5985,   5886,   5788,   5692,   5598,   5505,   5414,
 5324,   5235,   5148,   5063,   4979,   4896,   4815,   4735,
 4657,   4579,   4503,   4429,   4355,   4283,   4212,   4142,
 4073,   4005,   3939,   3874,   3809,   3746,   3684,   3623,
 3563,   3504,   3445,   3388,   3332,   3277,   3222,   3169,
 3116,   3065,   3014,   2964,   2914,   2866,   2819,   2772,
 2726,   2681,   2636,   2592,   2549,   2507,   2465,   2424,
 2384,   2345,   2306,   2267,   2230,   2193,   2156,   2121,
 2085,   2051,   2017,   1983,   1950,   1918,   1886,   1855,
 1824,   1794,   1764,   1735,   1706,   1678,   1650,   1622,
 1596,   1569,   1543,   1517,   1492,   1467,   1443,   1419,
 1396,   1372,   1350,   1327,   1305,   1284,   1262,   1241,
 1221,   1200,   1181,   1161,   1142,   1123,   1104,   1086,
 1068,   1050,   1033,   1015,    999,    982,    966,    950,
  934,    918,    903,    888,    873,    859,    845,    831,
  817,    803,    790,    777,    764,    751,    739,    727,
  715,    703,    691,    680,    668,    657,    646,    636,
  625,    615,    604,    594,    585,    575,    565,    556,
  547,    538,    529,    520,    511,    503,    494,    486,
  478,    470,    462,    455,    447,    440,    432,    425,
  418,    411,    404,    398,    391,    385,    378,    372,
  366,    360,    354,    348,    342,    336,    331,    325,
  320,    315,    309,    304,    299,    294,    289,    285,
  280,    275,    271,    266,    262,    257,    253,    249,
  245,    241,    237,    233,    229,    225,    221,    218
};

uint32_t getLFOPeriod(uint8_t rate) {
  // algorithm determined heuristically.
  // this floating point math would be way too
  // slow to calculate on device, so instead using
  // a precalculated lookup table in progmem.
  // round(1/(1.25^(0.3*(rate/4) - 15.4)))
  uint16_t period = pgm_read_word_near(LFO_PERIODS + rate);
  return (uint32_t) period;
}
