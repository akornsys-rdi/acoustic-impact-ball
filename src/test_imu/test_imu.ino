#include <Wire.h>
#include <Adafruit_LIS3DH.h>
#include <Adafruit_Sensor.h>

Adafruit_LIS3DH lis = Adafruit_LIS3DH();

void setup(void) {
  SerialUSB.begin(115200);
  while (!SerialUSB) delay(10);
  if (! lis.begin(0x18)) {
    while (1) yield();
  }
  lis.setRange(LIS3DH_RANGE_4_G);
  lis.setDataRate(LIS3DH_DATARATE_400_HZ);
}

void loop() {
  lis.read();
  SerialUSB.print(lis.x);
  SerialUSB.print(" ");
  SerialUSB.print(lis.y);
  SerialUSB.print(" ");
  SerialUSB.println(lis.z);
  delay(20);
}
