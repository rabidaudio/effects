#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/sleep.h>

// F_CLK/(2*N*(1+OCR0A)) for 10kHz to 200kHz -> OCR0A: [9, 199]
#define CLOCK_FREQ_MAX 199
#define CLOCK_FREQ_MIN 9

// software triangle LFO. lfoCounter counts 0..255 up, then lfoDirection inverts
// and lfoCounter counts 0..255 again to complete 1 period. At each step, depthCounter
// increments or decrements by depthStep, computed by the DEPTH_COUNTER_LUT lookup table.
uint8_t lfoCounter = 0;
bool lfoDirectionUp = true;
uint16_t depthCounter = 0;
uint8_t depthStep;

volatile uint8_t freqValue = CLOCK_FREQ_MIN;
volatile uint8_t depth = 255;
volatile uint8_t width = 255;

// switch between ADC3 (3, PB3, depth) and ADC1 (2, PB4, width)
volatile uint8_t adcSourceIdx = 0;
#define CURRENT_ADC (adcSourceIdx ? 3 : 2)

// scales 0..255 to 0..(199-9)
// ruby -e 'puts (0..255).map { |d| ((d.to_f / 256)*(199-9)).round }.join(", ")'
const uint8_t DEPTH_COUNTER_LUT[256] PROGMEM = {
  0, 1, 1, 2, 3, 4, 4, 5, 6, 7, 7, 8, 9, 10, 10, 11, 12, 13, 13, 14, 15, 16, 16, 17, 18, 19, 19, 20, 21, 22, 22, 23, 24, 24, 25, 26, 27, 27, 28, 29, 30, 30, 31, 32, 33, 33, 34, 35, 36, 36, 37, 38, 39, 39, 40, 41, 42, 42, 43, 44, 45, 45, 46, 47, 48, 48, 49, 50, 50, 51, 52, 53, 53, 54, 55, 56, 56, 57, 58, 59, 59, 60, 61, 62, 62, 63, 64, 65, 65, 66, 67, 68, 68, 69, 70, 71, 71, 72, 73, 73, 74, 75, 76, 76, 77, 78, 79, 79, 80, 81, 82, 82, 83, 84, 85, 85, 86, 87, 88, 88, 89, 90, 91, 91, 92, 93, 94, 94, 95, 96, 96, 97, 98, 99, 99, 100, 101, 102, 102, 103, 104, 105, 105, 106, 107, 108, 108, 109, 110, 111, 111, 112, 113, 114, 114, 115, 116, 117, 117, 118, 119, 119, 120, 121, 122, 122, 123, 124, 125, 125, 126, 127, 128, 128, 129, 130, 131, 131, 132, 133, 134, 134, 135, 136, 137, 137, 138, 139, 140, 140, 141, 142, 143, 143, 144, 145, 145, 146, 147, 148, 148, 149, 150, 151, 151, 152, 153, 154, 154, 155, 156, 157, 157, 158, 159, 160, 160, 161, 162, 163, 163, 164, 165, 166, 166, 167, 168, 168, 169, 170, 171, 171, 172, 173, 174, 174, 175, 176, 177, 177, 178, 179, 180, 180, 181, 182, 183, 183, 184, 185, 186, 186, 187, 188, 189, 189,
};

// scales 0..255 to period values 255..42 loosely following a polynomial transfer function, tuned by hand
// https://docs.google.com/spreadsheets/d/1UlEBGcFR5FqWzkLAmOnuRD5kNcWoktN6xEXLz-z1iqA/edit?gid=1511777380#gid=1511777380
const uint8_t WIDTH_PERIOD_LUT[256] PROGMEM = {
  255, 254, 253, 252, 251, 250, 249, 248, 247, 246, 245, 244, 243, 242, 241, 240, 239, 238, 237, 236, 235, 234, 233, 232, 231, 230, 229, 228, 227, 226, 225, 224, 223, 222, 221, 220, 219, 218, 217, 216, 215, 214, 213, 212, 211, 210, 209, 208, 207, 206, 205, 204, 203, 202, 201, 200, 199, 198, 197, 196, 195, 194, 193, 192, 191, 190, 189, 188, 187, 186, 185, 184, 183, 182, 181, 180, 179, 178, 177, 176, 175, 174, 173, 172, 171, 170, 169, 168, 167, 166, 165, 164, 163, 162, 161, 160, 159, 158, 157, 156, 154, 152, 151, 149, 148, 146, 145, 143, 142, 141, 139, 138, 136, 135, 134, 132, 131, 130, 129, 127, 126, 125, 124, 122, 121, 120, 119, 118, 117, 116, 114, 113, 112, 111, 110, 109, 108, 107, 106, 105, 104, 103, 102, 101, 100, 99, 98, 98, 97, 96, 95, 94, 93, 92, 91, 91, 90, 89, 88, 87, 87, 86, 85, 84, 84, 83, 82, 81, 81, 80, 79, 79, 78, 77, 77, 76, 75, 75, 74, 73, 73, 72, 72, 71, 70, 70, 69, 69, 68, 68, 67, 67, 66, 65, 65, 64, 64, 63, 63, 62, 62, 61, 61, 60, 60, 59, 59, 59, 58, 58, 57, 57, 56, 56, 56, 55, 55, 54, 54, 53, 53, 53, 52, 52, 51, 51, 51, 50, 50, 50, 49, 49, 49, 48, 48, 48, 47, 47, 47, 46, 46, 46, 45, 45, 45, 44, 44, 44, 43, 43, 43, 43, 42, 42, 42, 42,
};

int main(void) {
  // configure system clock to 2MHz
  CLKPR = (1 << CLKPCE); // initialize prescale change, 4 cycles to update the prescale
  CLKPR = 1; // change runtime sysclock prescaler to /2 (4MHz)

  DDRB |= (1 << DDB0) | (1 << DDB2); // set OC0A and PB2 as outputs

  // CONFIGURE ADC

  PRR &= ~(1 << PRADC); // ensure ADC is powered on
  ACSR |= (1 << ACD); // disable analog comparator (for power savings during sleep)
  
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
  TCCR0B = (0 << WGM02) | (0 < CS02) | (0 << CS01) | (1 << CS00); // clock prescaler = 1 (no scaling, run timer at 2MHz)
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

  GTCCR &= ~(1 << PSR0); // reset timers and start counting
  ADCSRA |= (1 << ADSC); // start conversion

  while (1) {
    set_sleep_mode(SLEEP_MODE_IDLE); // idle mode keeps timers and ADC running
    sleep_enable();
    sei();
    sleep_cpu(); // cpu will turn off until next interrupt is triggered, then we will resume here
    sleep_disable(); // re-disable on wakeup (good practice, will enable again next sleep loop)
  }

  return 0;
}

ISR(TIMER0_COMPA_vect) {
  OCR0A = freqValue; // use the latest computed value to update TIM0 period
}

ISR(TIMER1_COMPA_vect) {
  TCNT1 = 0; // restart counter

  lfoCounter++;
  if (lfoCounter == 0) {
    if (!lfoDirectionUp) {
      // end of a full LFO period, use the latest value of depth to restart the software counter
      depthCounter = 0; // reset
      depthStep = pgm_read_byte_near(DEPTH_COUNTER_LUT + depth);
    }
    lfoDirectionUp = !lfoDirectionUp;

    OCR1A =  pgm_read_byte_near(WIDTH_PERIOD_LUT + width);
    OCR1B = depthStep;
  }
  freqValue = CLOCK_FREQ_MIN + (uint8_t)(depthCounter / 256); // guaranteed by LUT not to overflow
  if (lfoDirectionUp) {
    depthCounter += depthStep;
  } else {
    depthCounter -= depthStep;
  }
  // hacky low-frequency pwm without an additional timer
  // TODO: could we use OCR1B instead?
  if (lfoCounter >= depthStep) {
    PORTB |= (1 << PORTB2); // on
  } else {
    PORTB &= ~(1 << PORTB2); // off
  }
}

ISR(ADC_vect) {
  // read value
  if (adcSourceIdx) {
    depth = ADCH;
  } else {
    width = ADCH;
  }
  adcSourceIdx = !adcSourceIdx;
  ADMUX = (ADMUX & 0xF0) | CURRENT_ADC; // switch source
  ADCSRA |= (1 << ADSC); // start measurement
}
