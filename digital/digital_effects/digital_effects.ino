#include <Audio.h>
#include <Wire.h>
#include <SPI.h>
//#include <SD.h>
//#include <SerialFlash.h>

#define USB_MODE 1

AudioInputI2S            in;
AudioOutputI2S           out;

#if USB_MODE
AudioInputUSB            usbIn;
AudioOutputUSB           usbOut;
#endif

AudioSynthWaveform       waveform1;

AudioConnection          patchCord1(in, 0, out, 0);
AudioConnection          patchCord2(in, 1, out, 1);
#if USB_MODE
AudioConnection          patchCord3(waveform1, 0, out2, 0);
AudioConnection          patchCord4(waveform1, 0, out2, 1);
AudioControlSGTL5000     sgtl5000_1;

void setup() {
  Serial.begin(115200);
  AudioMemory(12);
  sgtl5000_1.enable();
  sgtl5000_1.volume(0.6);
  waveform1.begin(WAVEFORM_SINE);
  waveform1.frequency(440);
  waveform1.amplitude(0.9);
}

void loop() {
//  float vol = usb1.volume();
//  if (vol > 0) {
//    // scale 0 = 1.0 range to:
//    //  0.3 = almost silent
//    //  0.8 = really loud
//    vol = 0.3 + vol * 0.5;
//  }
//  sgtl5000_1.volume(vol);
  Serial.println(AudioMemoryUsage());


  delay(1000);
}
