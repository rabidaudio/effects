template <uint8_t DEPTH>
class Oversampling {
  private:
    uint16_t _sum = 0;
    uint8_t _current = 0;
    uint8_t _idx = DEPTH;

  public:
    void sample(uint8_t val) {
      _sum += val;
      _idx--;
      if (_idx == 0) {
        _current = (uint8_t) (_sum / DEPTH);
        _sum = 0;
        _idx = DEPTH;
      }
    }

    uint8_t read() {
      return _current;
    }
};

// Oversampling<8> width;
// Oversampling<8> depth;
volatile uint8_t width;
volatile uint8_t depth;

uint8_t adcSrc = 0; // switch between ADC0 (0) and ADC1 (1).


void setup() {
  Serial.begin(9600);
  
  PRR &= ~(1 << PRADC); // ensure ADC is powered on
  
  ADMUX = (0b01 << REFS0) | (1 << ADLAR) | adcSrc; // Vref=Vcc, left-align, mux select
  ADCSRA |= (1 << ADEN) | (1 << ADIE) | (0 << ADATE) | (0b101 << ADPS0); // enable ADC, enable interrupt, manual trigger, prescaler = 32

  ADCSRA |= (1 << ADSC); // start conversion
  sei();
}

ISR(ADC_vect) {
  cli();
  // read value
  if (adcSrc) {
    depth = ADCH;
    // depth.sample(ADCH);
  } else {
    width = ADCH;
    // width.sample(ADCH);
  }
  adcSrc = !adcSrc;
  ADMUX = (ADMUX & 0xF0) | adcSrc; // switch source
  ADCSRA |= (1 << ADSC); // start measurement
  sei();
}

void loop() {
  Serial.print(width); Serial.print("\t");
  Serial.print(depth); Serial.println();
  delay(100);
}
