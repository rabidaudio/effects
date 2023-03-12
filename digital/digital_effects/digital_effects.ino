#include <Audio.h>
#include <Wire.h>
#include <SPI.h>
#include <SD.h>
#include <SerialFlash.h>

#define SWITCH0_PIN 29
#define SWITCH1_PIN 30
#define BYPASS_PIN 31

// In: ORANGE
// Out: BLUE

// GUItool: begin automatically generated code
AudioInputI2S            i2s1;           //xy=66,333
AudioEffectBitcrusher    bitcrusher1;    //xy=343,283
AudioOutputI2S           i2s2;           //xy=623,321
AudioConnection          patchCord1(i2s1, 0, bitcrusher1, 0);
AudioConnection          patchCord2(i2s1, 1, i2s2, 1);
AudioConnection          patchCord3(bitcrusher1, 0, i2s2, 0);
// GUItool: end automatically generated code

AudioControlSGTL5000     sgtl5000_1;

// TODO: Debounced Knob? Hold value costant unless value is changing
template <size_t BUFF_SIZE>
class BufferedInput
{
private:
  uint8_t _pin;
  uint16_t _buffer[BUFF_SIZE];
  size_t _index;

public:
  void begin(uint8_t pin)
  {
    _pin = pin;
    _index = 0;
    for (size_t i = 0; i < BUFF_SIZE; i++)
    {
      read();
      delay(10);
    }
  }

  uint16_t read()
  {
    _buffer[_index] = analogRead(_pin);
    _index = (_index + 1) % BUFF_SIZE;
    uint16_t value = 0;
    for (size_t i = 0; i < BUFF_SIZE; i++)
    {
      value += _buffer[i];
    }
    return value / BUFF_SIZE;
  }
};

BufferedInput<16> knob0;
//BufferedInput<16> knob1;
//BufferedInput<16> knob2;
//BufferedInput<16> knob3;
//BufferedInput<16> knob4;

class DebouncedInterrupt {
    size_t _pin;
    uint16_t _delayTime;
    uint32_t _lastChangeAt;
    bool _value;

   public:

  void begin(size_t pin, void(*cb)(void), uint16_t delayTime = 10) {
    _pin = pin;
    _delayTime = delayTime;
    _lastChangeAt = 0;
    pinMode(_pin, INPUT_PULLDOWN);
    attachInterrupt(digitalPinToInterrupt(_pin), cb, CHANGE);
  }

  bool check() {
    uint32_t now = millis();
    if ((now - _lastChangeAt) > _delayTime) {
      _lastChangeAt = now;
      return true;
    }
    return false;
  }
};

DebouncedInterrupt sw0;
DebouncedInterrupt sw1;

void setup() {
//  Serial.begin(115200);
  AudioMemory(12);
  sgtl5000_1.enable();
  sgtl5000_1.volume(0.5);

//  knob0.begin(A0);  // 14
//  knob1.begin(A1);  // 15
//  knob2.begin(A2);  // 16
//  knob3.begin(A16); // 40
//  knob4.begin(A17); // 41
//  sw0.begin(SWITCH0_PIN, printSWState);
   sw1.begin(SWITCH1_PIN, printSWState);
   pinMode(BYPASS_PIN, OUTPUT);

//  mixer1.gain(0, 0);
//  mixer1.gain(1, 0);
//  mixer1.gain(2, 0);
//  mixer1.gain(3, 0);
}

void printSWState() {
  if (sw1.check()) {
    digitalWrite(BYPASS_PIN, digitalRead(SWITCH1_PIN));
  }
}

void loop() {
//  bitcrusher1.sampleRate(AUDIO_SAMPLE_RATE_EXACT / (float) knob0.read());
  
//  Serial.println(AudioMemoryUsage());
//  float wetLevel = ((float) (knob1.read())) / 1024.0; // %
//  float dryLevel = 1.0 - wetLevel;
//  float wetLevel = 0.75;
//  float dryLevel = 0.25;
//  float reverbLevel = ((float) knob0.read()) / 1024.0 * 15.0; // seconds
//  reverb1.reverbTime(reverbLevel);
//  mixer1.gain(1, wetLevel);
//  
//  mixer1.gain(0, dryLevel);
//  if (digitalRead(SWITCH1_PIN) || true) {
//    float reverbLevel = ((float) knob0.read()) / 1024.0 * 15.0; // seconds
//    reverb1.reverbTime(reverbLevel);
//    mixer1.gain(1, wetLevel);
//    mixer1.gain(2, 0);  
//  } else {
//    float roomSize = ((float) knob0.read()) / 1024.0; // %
//    float damping = 0.9;
////    float damping =  ((float) knob2.read()) / 1024.0; // %
//    freeverb1.roomsize(roomSize);
//    freeverb1.damping(damping);
//    mixer1.gain(1, 0);
//    mixer1.gain(2, wetLevel);
//  }

  delay(50);
}
