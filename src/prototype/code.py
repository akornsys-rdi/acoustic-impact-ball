import board
import digitalio
import time
import busio
import adafruit_lis3dh
import adafruit_sdcard
import storage
import os
import audioio
import audiobusio

led = digitalio.DigitalInOut(board.D13)
led.direction = digitalio.Direction.OUTPUT

i2c = busio.I2C(board.SCL, board.SDA)
int1 = digitalio.DigitalInOut(board.D6)
lis3dh = adafruit_lis3dh.LIS3DH_I2C(i2c, int1=int1)
lis3dh.range = adafruit_lis3dh.RANGE_2_G
lis3dh.set_tap(1, 80)

spi = busio.SPI(board.SCK, MOSI=board.MOSI, MISO=board.MISO)
cs = digitalio.DigitalInOut(board.D10)
sdcard = adafruit_sdcard.SDCard(spi, cs)
vfs = storage.VfsFat(sdcard)
storage.mount(vfs, "/sd")

wave_file = open("/sd/santi1-16k.wav", "rb")
wave = audioio.WaveFile(wave_file)
audio = audiobusio.I2SOut(board.D1, board.D0, board.D9)

def print_directory(path, tabs=0):
    for file in os.listdir(path):
        stats = os.stat(path + "/" + file)
        filesize = stats[6]
        isdir = stats[0] & 0x4000
        if filesize < 1000:
            sizestr = str(filesize) + " by"
        elif filesize < 1000000:
            sizestr = "%0.1f KB" % (filesize / 1000)
        else:
            sizestr = "%0.1f MB" % (filesize / 1000000)
        prettyprintname = ""
        for _ in range(tabs):
            prettyprintname += "   "
        prettyprintname += file
        if isdir:
            prettyprintname += "/"
        print('{0:<40} Size: {1:>10}'.format(prettyprintname, sizestr))
        if isdir:
            print_directory(path + "/" + file, tabs + 1)

print("Files on filesystem:")
print("====================")
print_directory("/sd")
print("")

last_tap = False
while True:
    x, y, z = lis3dh.acceleration
    e = (abs(x / 9.806) + abs(y / 9.806) + abs(z / 9.806) - 1.1)
    print('({})'.format(abs(e)))
    if e >= 0.2:
        tap = True
    else:
        tap = False
    #tap = lis3dh.tapped
    if tap and not last_tap:
        print('Triggered!')
        audio.play(wave)
        while audio.playing:
            pass
            x, y, z = lis3dh.acceleration
            e = (abs(x / 9.806) + abs(y / 9.806) + abs(z / 9.806) - 1.05)
            print('({})'.format(abs(e)))
            if abs(e) < 0.04:
                time.sleep(3)
                audio.stop()
            led.value = True
            time.sleep(0.1)
            led.value = False
            time.sleep(0.1)
    last_tap = tap
    time.sleep(0.2)

