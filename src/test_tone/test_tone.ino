#include <I2S.h>

const int frequency = 440;
const int amplitude = 500;
const int sampleRate = 8000;

const int halfWavelength = (sampleRate / frequency);

short sample = amplitude;
int count = 0;

void setup() {
  SerialUSB.begin(9600);
  SerialUSB.println("I2S simple tone");

  if (!I2S.begin(I2S_PHILIPS_MODE, sampleRate, 16)) {
    SerialUSB.println("Failed to initialize I2S!");
    while (1);
  }
  else {
    SerialUSB.println("Initialize I2S OK");
  }
}

void loop() {
  if (count % halfWavelength == 0) {
    sample = -1 * sample;
  }
  I2S.write(sample);
  I2S.write(sample);
  count++;
}
