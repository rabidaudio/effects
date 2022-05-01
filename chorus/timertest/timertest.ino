

void setup() {
  // DDRB =(1<<PB1); // set PB1 as output to enable PWM generation
  pinMode(1, OUTPUT);
  
  TCCR0A=0x00;
  // TCCR0A|=(1<<WGM00)|(1<<COM0A1)|(1<<COM0A0);
  TCCR0A|=(1<<WGM00)|(0<<WGM01)|(0<<COM0A1)|(1<<COM0B1)|(0<<COM0A0)|(1<<COM0B0);
  TCCR0B=0x00;
  TCCR0B |= (1<<WGM02)|(1<<CS01); // prescale 8
  TCNT0=0;
  OCR0A=200;
  OCR0B=100;


  // configure timer
//  noInterrupts();
  // Clear registers
//  TCCR0A = 0;
//  TCCR0B = 0;

//  OCR0B = 99;

  // mode 5, phase-correct PWM
  // this mode is double-buffered, so we can safely
  // change OCR0A at any time, and it will take effect on the
  // next cycle.
//  TCCR0A |= (1 << WGM00)|(1 << COM0A1)|(1<<COM0A0);
//  TCCR0B |= (1 << WGM02)|(1 << CS01);

//  TCCR0A |= ; // in mode 5, clear OC0A on up, set on down
  //TCCR0B |= (1 << CS01); // prescaler=8

  // 50000 Hz (8000000/((19+1)*8))
//    TCNT0 = 0;
//    OCR0A = 99;
//    OCR0B = 50;
  // CTC (clear timer on compare) TODO mode 5 instead?
//  TCCR0A |= (1 << WGM01);
  //TCCR0A = 5;
  // Prescaler 8
//  TCCR0B |= (1 << CS01); // prescaler=8
  // Output Compare Match A Interrupt Enable
  // TIMSK |= (1 << OCIE0A);
  interrupts();

  // reg GTCCR bit TSM pause timer
  // output on OC0A, OC0B pins
  // reg TCCR0A bit COM0A - enable pin
  // COM0A1=0,COM0A0=1 toggle

  // TCNT0 read current counter value
  // OCR0A compare register A
}

void loop() {
  // put your main code here, to run repeatedly:
//  uint16_t v = analogRead(A0);  
//  OCR0A = (uint8_t) map(v, 0, 1023, 4, 99);
//  delay(1);
//
//  digitalWrite(0, TCNT0 % 2 == 0 ? HIGH : LOW);
//  delay(1);
//  for (uint8_t i = 0; i <= 255; i++) {
//    OCR0A = i;
//    OCR0B = i / 2;
//    delay(100);
//  }
}
