#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>

// F_CLK/(2*N*(1+OCR0A)) for 10kHz to 100kHz -> OCR0A: [19, 199]
#define CLOCK_FREQ_MAX 199

// software triangle LFO. lfoCounter counts 0..255 up, then lfoDirection inverts
// and lfoCounter counts 0..255 again to complete 1 period. At each step, depthCounter
// increments or decrements by depthStep, computed by the DEPTH_COUNTER_LUT lookup table.
uint8_t lfoCounter = 0;
bool lfoDirectionUp = true;
uint16_t depthCounter = 0;
uint8_t depthStep;

volatile uint8_t freqValue = 19; //CLOCK_FREQ_MAX;
volatile uint8_t depth = 255;
volatile uint8_t width = 255;

// switch between ADC1 (1, PB2, depth) and ADC2 (2, PB4, width)
volatile uint8_t adcSourceIdx = 0;
#define CURRENT_ADC (adcSourceIdx ? 2 : 1)

// scales 0..255 to 0..(199-19)
// ruby -e 'puts (0..255).map { |d| ((d.to_f / 256)*(199-19)).round }.join(", ")'
const uint8_t DEPTH_COUNTER_LUT[256] PROGMEM = {
   0, 1, 1, 2, 3, 4, 4, 5, 6, 6, 7, 8, 8, 9, 10, 11, 11, 12, 13, 13, 14, 15, 15, 16, 17, 18, 18, 19, 20, 20, 21, 22, 23, 23, 24, 25, 25, 26, 27, 27, 28, 29, 30, 30, 31, 32, 32, 33, 34, 34, 35, 36, 37, 37, 38, 39, 39, 40, 41, 41, 42, 43, 44, 44, 45, 46, 46, 47, 48, 49, 49, 50, 51, 51, 52, 53, 53, 54, 55, 56, 56, 57, 58, 58, 59, 60, 60, 61, 62, 63, 63, 64, 65, 65, 66, 67, 68, 68, 69, 70, 70, 71, 72, 72, 73, 74, 75, 75, 76, 77, 77, 78, 79, 79, 80, 81, 82, 82, 83, 84, 84, 85, 86, 86, 87, 88, 89, 89, 90, 91, 91, 92, 93, 94, 94, 95, 96, 96, 97, 98, 98, 99, 100, 101, 101, 102, 103, 103, 104, 105, 105, 106, 107, 108, 108, 109, 110, 110, 111, 112, 113, 113, 114, 115, 115, 116, 117, 117, 118, 119, 120, 120, 121, 122, 122, 123, 124, 124, 125, 126, 127, 127, 128, 129, 129, 130, 131, 131, 132, 133, 134, 134, 135, 136, 136, 137, 138, 139, 139, 140, 141, 141, 142, 143, 143, 144, 145, 146, 146, 147, 148, 148, 149, 150, 150, 151, 152, 153, 153, 154, 155, 155, 156, 157, 158, 158, 159, 160, 160, 161, 162, 162, 163, 164, 165, 165, 166, 167, 167, 168, 169, 169, 170, 171, 172, 172, 173, 174, 174, 175, 176, 176, 177, 178, 179, 179,
};

uint8_t clamp(uint8_t value, uint8_t min, uint8_t max) {
  if (value < min) return min;
  if (value > max) return max;
  return value;
}

int main(void) {
  // configure system clock to 2MHz
  CLKPR = (1 << CLKPCE); // initialize prescale change, 4 cycles to update the prescale
  CLKPR = 1; // change runtime sysclock prescaler to /2 (4MHz)

  DDRB |= (1 << DDB0) | (1 << DDB3); // set OC0A and PB3 as outputs

  // CONFIGURE ADC

  PRR &= ~(1 << PRADC); // ensure ADC is powered on
  
  ADMUX = (0b00 << REFS0) | (1 << ADLAR) | CURRENT_ADC; // Vref=Vcc, left-align, mux select
  ADCSRA |= (1 << ADEN) | (1 << ADIE) | (0 << ADATE) | (0b101 << ADPS0); // enable ADC, enable interrupt, manual trigger, prescaler = 32

  // CONFIGURE TIMERS
  
  // disable timers
  TCCR0B = 0;
  TCCR1 = 0;
  // halt prescaler, allowing us to configure timers
  GTCCR = (1<<TSM)|(1<<PSR0)|(1<<PSR1);

  // TIM0: a variable-frequency square wave from 10kHz to 100kHz, controlled by OCR0A
  TCCR0A = (0 << COM0A1) | (1 << COM0A0) | (1 << WGM01) | (0 << WGM00); // toggle OC0A output on compare match, CTC mode
  TCCR0B = (0 << WGM02) | (0 < CS02) | (0 << CS01) | (1 << CS00); // clock prescaler = 1 (no scaling, run timer at 4MHz)
  // TCCR0B = 0b101; // puts the output clock in a visual range for debugging
  // Due to toggle, the output frequency is F_CLK/(2*N*(1+OCR0A))
  // Thus OCR0A varies clock from 2MHz to 7.8kHz
  // For control range 10kHz to 100kHz, values should range from 199 to 19
  OCR0A = freqValue; // initalize
  // NOTE: only update OCR0A on compare match A interrupt, since it isn't double-buffered
  
  // TIM1: a low-frequency timer to update a software counter tracking a triangle wave
  // triggers 512 times for a single tringle wave period (8bit software counter counts up then down)
  // NOTE: for TIM1, CTC is only available on OCR1C, however there is no interrupt for OCR1C
  // Instead we run OCR1A and explicitly reset it in interrupt
  TCCR1 = (0 << CS13) | (1 << CS12) | (1 << CS11) | (1 << CS10); // prescaler=64 (4MHz / 64 = 62.5kHz)
  // for LFO frequencies from 0.5Hz to 2.5Hz, vary this from 49 to 244 (62.5kHz / (2*256))
  OCR1A = 255;

  // interrupts
  TIMSK = (1 << OCIE1A) | (1 << OCIE0A); // enable OCIE1A and OCIE0A compare match interrupts

  TCNT0 = 0; // restart counter 0
  TCNT1 = 0; // restart counter 1

  GTCCR = 0; // reset timers and start counting
  ADCSRA |= (1 << ADSC); // start conversion
  sei();

  while (1) {
    ;; // TODO: sleep to idle mode
  }

  return 0;
}

ISR(TIMER0_COMPA_vect) {
  cli();
  OCR0A = freqValue; // use the latest computed value to update TIM0 period
  sei();
}

ISR(TIMER1_COMPA_vect) {
  TCNT1 = 0; // restart counter

  lfoCounter++;
  cli();
  if (lfoCounter == 0) {
    if (!lfoDirectionUp) {
      // end of a full LFO period, use the latest value of depth to restart the software counter
      depthCounter = 0; // reset
      depthStep = pgm_read_byte_near(DEPTH_COUNTER_LUT + depth);
    }
    lfoDirectionUp = !lfoDirectionUp;

    OCR1A = clamp(width, 10, 254); // load the latest value into TIM1 period NOTE: could clamp to 49-255
  }
  freqValue = CLOCK_FREQ_MAX-(uint8_t)(depthCounter / 256); // garanteed by LUT not to overflow
  sei();
  if (lfoDirectionUp) {
    depthCounter += depthStep;
  } else {
    depthCounter -= depthStep;
  }
  if (lfoCounter >= depthStep) {
    PORTB &= ~(1 << PORTB3); // off
  } else {
    PORTB |= (1 << PORTB3); // on
  }
}

ISR(ADC_vect) {
  cli();
  // read value
  if (adcSourceIdx) {
    depth = ADCH;
  } else {
    width = ADCH;
  }
  adcSourceIdx = !adcSourceIdx;
  ADMUX = (ADMUX & 0xF0) | CURRENT_ADC; // switch source
  ADCSRA |= (1 << ADSC); // start measurement
  sei();
}
