#define DEBUG 13

#define BATTERY_MEAN_SIZE 512     // numero de muestras para la media en `read_battery()`
#define BATTERY_THRESHOLD 2800    // tensión de umbral para bateria baja
#define IMU_DEVIATION_SIZE 160    // numero de muestras para la desviacion tipica en `read_imu()`
#define ATTACK_THRESHOLD 95       // umbral de inicio de deteccion de movimiento
#define DECAY_THRESHOLD 65        // umbral de paro de deteccion de movimento
#define DECAY_DELAY 1000          // retraso en el paro de la deteccion de movimiento
#define INITIAL_DELAY 10000       // tiempo de retraso en empezar a funcionar
#define VOLUME 70                 // volumen de la reproduccion. 0 to 100

#include <Wire.h>
#include <Adafruit_LIS3DH.h>
#include <Adafruit_Sensor.h>
#include <SD.h>
#include <ArduinoSound.h>

Adafruit_LIS3DH imu = Adafruit_LIS3DH();
const char filename[] = "AUDIO.WAV";
SDWaveFile wave_file;

void setup() {
    analogReference(AR_INTERNAL2V23);
    pinMode(DEBUG, OUTPUT);
    // SerialUSB.begin(115200);
    // while(!SerialUSB);
    for (int i = 0; i < BATTERY_MEAN_SIZE ; i++) { //llena el buffer
        read_battery();
    }
    for (int i = 0; i < IMU_DEVIATION_SIZE ; i++) { //llena el buffer
        read_imu();
    }
}

void loop() {
    //flags de estado
    static boolean first_run = false;
    static boolean batt_low = false;
    static boolean imu_error = false;
    static boolean sd_error = false;
    static boolean hw_error = false;
    static boolean initial_delay = false;
    static boolean motion = false;

    if (!first_run) {
        first_run = true;
        initial_delay = true;
        imu_error = !imu.begin(0x18);
        if (!imu_error) {
            imu.setRange(LIS3DH_RANGE_4_G);
            imu.setDataRate(LIS3DH_DATARATE_400_HZ);
        }
        sd_error = !SD.begin(10);
        if (!sd_error) {
            wave_file = SDWaveFile(filename);
            sd_error |= !wave_file;
//            SerialUSB.println("File OK:");
//            SerialUSB.print("Bits per sample = ");
//            SerialUSB.println(wave_file.bitsPerSample());
//            SerialUSB.print("Channels = ");
//            SerialUSB.println(wave_file.channels());
//            SerialUSB.print("Sample rate = ");
//            SerialUSB.print(wave_file.sampleRate());
//            SerialUSB.println(" Hz");
//            SerialUSB.print("Duration = ");
//            SerialUSB.print(wave_file.duration());
//            SerialUSB.println(" seconds");
            AudioOutI2S.volume(VOLUME);
            sd_error |= !AudioOutI2S.canPlay(wave_file);
            AudioOutI2S.loop(wave_file);
            AudioOutI2S.pause();
        }
    }
    hw_error = imu_error | sd_error;

    if (!initial_delay) {
        if (!batt_low && !hw_error) {
            // SerialUSB.println("\tOK");
            if (motion) {
              // SerialUSB.println("\tPLAY");
                if (!AudioOutI2S.isPlaying()) AudioOutI2S.resume();
            }
            else {
                // SerialUSB.println("\tPAUSE");
                if (AudioOutI2S.isPlaying()) AudioOutI2S.pause();
            }
        }
        else {
            // SerialUSB.println("\tSTOP");
            if (AudioOutI2S.isPlaying()) AudioOutI2S.stop();
        }
    }

    set_status(&batt_low, &motion, &initial_delay);
    display_status(batt_low, hw_error, motion, initial_delay);
}

// Lee el valor de la batería y realiza una media del valor
// Devuelve: el valor filtrado de la batería en mv
unsigned int read_battery() {
    static unsigned int battery_samples[BATTERY_MEAN_SIZE];
    unsigned int ret = 0;
    unsigned long sum = 0;

    for (int i = BATTERY_MEAN_SIZE - 2; i >= 0 ; i--) {
        battery_samples[i + 1] = battery_samples[i];
    }
    battery_samples[0] = analogRead(A0) * 4.35546875;
    // SerialUSB.print(battery_samples[0]);
    sum = 0;
    for (int i = 0; i < BATTERY_MEAN_SIZE ; i++) {
        sum += battery_samples[i];
    }
    ret = sum / BATTERY_MEAN_SIZE;
    // SerialUSB.print(" ");
    // SerialUSB.println(ret);
    return ret;
}

// Lee el valor de los ejes del acelerómetro y realiza una desviación típica del valor
// Devuelve: el valor filtrado de los tres ejes del acelerómetro
unsigned long read_imu() {
    static long imu_samples[IMU_DEVIATION_SIZE];
    long imu_vector = 0;
    long mean = 0;
    long deviation = 0;
    unsigned long ret = 0;

    for (int i = IMU_DEVIATION_SIZE - 2; i >= 0 ; i--) {
        imu_samples[i + 1] = imu_samples[i];
    }
    imu.read();
    imu_vector = imu.x + imu.y + imu.z;
    imu_samples[0] = constrain(map(imu_vector, -10000, 10000, 0, 4096),0,4096);
    mean = 0;
    for (int i = 0; i < IMU_DEVIATION_SIZE ; i++) {
        mean += imu_samples[i];
    }
    mean /= IMU_DEVIATION_SIZE;
    deviation = 0;
    for (int i = 0; i < IMU_DEVIATION_SIZE ; i++) {
        deviation += pow(imu_samples[i] - mean, 2);
    }
    deviation /= IMU_DEVIATION_SIZE;
    ret = (unsigned long) abs(sqrt(deviation));
    return ret;
}

// Establece los indicadores de estado procesando el acelerómetro y la batería
// Requiere:
//  batt_low: puntero donde se guarda el estado de batería baja
//  motion: puntero donde se guarda la deteccion de movimiento
void set_status(boolean *batt_low, boolean *motion, boolean *initial_delay) {
    static boolean start_delay_imu = false;
    static unsigned long t_batt = 0;
    static unsigned long t_imu = 0;
    static unsigned long t_imu_start = 0;
    unsigned long imu_value = 0;

    if (millis() > INITIAL_DELAY) {
        *initial_delay = false;
    }
    imu_value = read_imu();
    if (imu_value > ATTACK_THRESHOLD) {
        *motion = true;
        start_delay_imu = false;
    }
    else if (imu_value < DECAY_THRESHOLD) start_delay_imu = true;
    if ((millis() - t_imu >= DECAY_DELAY) && start_delay_imu && *motion) {
        t_imu = millis();
        start_delay_imu = false;
        *motion = false;
    }
    if (millis() - t_batt >= 25) {
        t_batt = millis();
        if (*batt_low == false) {
          if (read_battery() < BATTERY_THRESHOLD) {
              *batt_low = true;
          }
        }
    }
}

// Muestra el estado actual usando un LED
// Requiere:
//  batt_low: indicador de batería baja
//  hw_error: indicador de fallo de hardware
//  playing: indicador de reproduccion de audio
void display_status(boolean batt_low, boolean hw_error, boolean playing, boolean initial_delay) {
    if (batt_low) digitalWrite(DEBUG, HIGH);
    else if (hw_error) digitalWrite(DEBUG, millis() & 0x20);
    else if (playing && !initial_delay) digitalWrite(DEBUG, millis() & 0x80);
    else if (initial_delay) digitalWrite(DEBUG, millis() & 0xE0);
    else digitalWrite(DEBUG, LOW);
}
