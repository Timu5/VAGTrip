#ifndef KWP_h
#define KWP_h

#include <inttypes.h>
#include <Arduino.h>

#include "NewSoftwareSerial.h"

#define ADR_Engine 0x01 // Engine
#define ADR_Gears  0x02 // Auto Trans
#define ADR_ABS_Brakes 0x03
#define ADR_Airbag 0x15
#define ADR_Dashboard 0x17 // Instruments
#define ADR_Immobilizer 0x25
#define ADR_Central_locking 0x35
#define ADR_Navigation 0x37

struct KWPSensor
{
  uint8_t type;
  uint8_t a;
  uint8_t b;
  float value;
  char* units;
};

class KWP
{
  public:
    KWP(uint8_t receivePin, uint8_t transmitPin);
    bool connect(uint8_t addr, int baudrate);
    void disconnect();
    int readBlock(uint8_t addr, int group, int maxSensorsPerGroup, KWPSensor resGroupSensor[]);
    uint8_t getFaultsCount();
    void clearFaults();
    KWPSensor getSensorData(byte k, byte a, byte b);
    bool isConnected();
    uint8_t getCurrAddr();
 
  private:
    uint8_t _OBD_RX_PIN;
    uint8_t _OBD_TX_PIN;

    bool connected = false;
    uint8_t blockCounter = 0;
    uint8_t errorTimeout = 0;
    uint8_t errorData = 0;

    NewSoftwareSerial obd;

    void obdWrite(uint8_t data);
    uint8_t obdRead();
    bool KWPSend(char *s, int size);
    bool KWPReceive(char s[], int maxsize, int &size, bool init_delay = false);
    bool KWPSendAck();

};

#endif

