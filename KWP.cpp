#include "KWP.h"
#include <Arduino.h>

KWP::KWP(uint8_t receivePin, uint8_t transmitPin) : obd(NewSoftwareSerial(receivePin, transmitPin, false))
{
  _OBD_RX_PIN = receivePin;
  _OBD_TX_PIN = transmitPin;

  pinMode(transmitPin, OUTPUT);
  digitalWrite(transmitPin, HIGH);
}

bool KWP::connect(uint8_t addr, int baudrate)
{ 
  blockCounter = 0;
  obd.begin(baudrate);

  for(uint8_t i = 0; i < 8; i++)
  {
    digitalWrite(_OBD_TX_PIN, i % 2 ? HIGH : LOW);
    delay((0b011110 >> i) & 1 ? 400 : 200);
  }
  obd.flush();

  char s[3];
  int size = 3;
  if (!KWPReceive(s, 3, size)) return false;
  if ((s[0] != 0x55) || (s[1] != 0x01) || (s[2] != 0x8A))
  {
    disconnect();
    errorData++;
    return false;
  }
  connected = true;

  while (true)
  {
    int size = 0;
    char s[64];
    if (!(KWPReceive(s, 64, size)))
      return false;
    if (size == 0) return false;
    if (s[2] == 0x09) break;
    if (s[2] != 0xF6)
    {
      disconnect();
      errorData++;
      return false;
    }
    if (!KWPSendAck()) return false;
  }
  return true;
}

void KWP::disconnect()
{
  connected = false;
}

uint8_t KWP::readBlock(uint8_t group, uint8_t maxSensorsPerBlock, KWPSensor resGroupSensor[])
{
  char s[64] = { 0x04, blockCounter, 0x29, group, 0x03 };
  if (!KWPSend(s, 5)) return false;
  int size = 0;
  KWPReceive(s, 64, size);
  if (s[2] != 0xe7)
  {
    disconnect();
    errorData++;
    return 0;
  }
  int count = (size-4) / 3;
  if (count > maxSensorsPerBlock)
  {
    disconnect();
    errorData++;
    return 0;
  }

  for (int idx=0; idx < count; idx++)
  {
    byte k = s[3 + idx*3];
    byte a = s[3 + idx*3+1];
    byte b = s[3 + idx*3+2];

    resGroupSensor[idx] = getSensorData(k, a, b);
  }
  return count;
}

uint8_t KWP::getFaults(uint16_t *buffer, uint8_t maxsize)
{
 
  char s[64] = {0x03, blockCounter, 0x07, 0x03};
  if (!KWPSend(s, 4))  return false;
  int size = 0;
  int count = 0;
  while (KWPReceive(s, 64, size))
  {
    if (s[2] == 0xFC)
    {
      int n = (size - 4) / 3;
      for(int i = 0; i < n; i++)
      {
        if(count < maxsize)
        {
          if(buffer)
            buffer[count] = (s[3 + i * 3] << 8) + s[4 + i * 3];
          count++;
        }
      }
    }
    else if (s[2] == 0x09)
    {
      // no more codes!
      break;
    }
    else
    {
      disconnect();
      errorData++;
      return 0;
    }
  }

  if(count == 1 && buffer[0] == 0xFFFF)
    count = 0;

  return count;
}

uint8_t KWP::getFaultsCount()
{
  return getFaults(NULL, 128);
}

void KWP::clearFaults()
{
  char s[64] = { 0x03, blockCounter, 0x05, 0x03 };
  if (!KWPSend(s, 4)) return;
  int size = 0;
  KWPReceive(s, 64, size);
  if (s[2] != 0x09)
  {
    disconnect();
    errorData++;
  }
}

KWPSensor KWP::getSensorData(byte k, byte a, byte b)
{
    KWPSensor res;
    float v = 0;
    char* units = "";
    switch (k)
    {
      case 1:  v=0.2*a*b;             units=PSTR("rpm"); break;
      case 2:  v=a*0.002*b;           units=PSTR("%"); break; // case 2:  v=a*0.002*b;            units=PSTR("%%");break;
      case 3:  v=0.002*a*b;           units=PSTR("Deg"); break;
      case 4:  v=abs(b-127)*0.01*a;   units=PSTR("ATDC"); break;
      case 5:  v=a*(b-100)*0.1;       units=PSTR("c");break;
      case 6:  v=0.001*a*b;           units=PSTR("v");break;
      case 7:  v=0.01*a*b;            units=PSTR("km/h");break;
      case 8:  v=0.1*a*b;             units=PSTR(" ");break;
      case 9:  v=(b-127)*0.02*a;      units=PSTR("Deg");break;
      //case 10: if (b == 0) t=PSTR("COLD"); else t=PSTR("WARM");break;
      case 10: if (b == 0) units=PSTR("COLD"); else units=PSTR("WARM");break;
      case 11: v=0.0001*a*(b-128)+1;  units = PSTR(" ");break;
      case 12: v=0.001*a*b;           units =PSTR("Ohm");break;
      case 13: v=(b-127)*0.001*a;     units =PSTR("mm");break;
      case 14: v=0.005*a*b;           units=PSTR("bar");break;
      case 15: v=0.01*a*b;            units=PSTR("ms");break;
      case 18: v=0.04*a*b;            units=PSTR("mbar");break;
      case 19: v=a*b*0.01;            units=PSTR("l");break;
      case 20: v=a*(b-128)/128;       units=PSTR("%");break; // case 20: v=a*(b-128)/128;       units=PSTR("%%");break;
      case 21: v=0.001*a*b;           units=PSTR("V");break;
      case 22: v=0.001*a*b;           units=PSTR("ms");break;
      case 23: v=b/256*a;             units=PSTR("%");break; //case 23: v=b/256*a;             units=PSTR("%%");break;
      case 24: v=0.001*a*b;           units=PSTR("A");break;
      case 25: v=(b*1.421)+(a/182);   units=PSTR("g/s");break;
      case 26: v=float(b-a);          units=PSTR("C");break;
      case 27: v=abs(b-128)*0.01*a;   units=PSTR("Deg");break; //case 27: v=abs(b-128)*0.01*a;   units=PSTR("°");break;
      case 28: v=float(b-a);          units=PSTR(" ");break;
      case 30: v=b/12*a;              units=PSTR("Deg k/w");break;
      case 31: v=b/2560*a;            units=PSTR("°C");break;
      case 33: v=100*b/a;             units=PSTR("%");break; //case 33: v=100*b/a;             units=PSTR("%%");break;
      case 34: v=(b-128)*0.01*a;      units=PSTR("kW");break;
      case 35: v=0.01*a*b;            units=PSTR("l/h");break;
      case 36: v=((unsigned long)a)*2560+((unsigned long)b)*10;  units=PSTR("km");break;
      case 37: v=b; break; // oil pressure ?!
      // ADP: FIXME!
      /*case 37: switch(b){
             case 0: sprintPSTR(buf, PSTR("ADP OK (%d,%d)"), a,b); t=String(buf); break;
             case 1: sprintPSTR(buf, PSTR("ADP RUN (%d,%d)"), a,b); t=String(buf); break;
             case 0x10: sprintPSTR(buf, PSTR("ADP ERR (%d,%d)"), a,b); t=String(buf); break;
             default: sprintPSTR(buf, PSTR("ADP (%d,%d)"), a,b); t=String(buf); break;
          }*/
      case 38: v=(b-128)*0.001*a;        units=PSTR("Deg k/w"); break;
      case 39: v=b/256*a;                units=PSTR("mg/h"); break;
      case 40: v=b*0.1+(25.5*a)-400;     units=PSTR("A"); break;
      case 41: v=b+a*255;                units=PSTR("Ah"); break;
      case 42: v=b*0.1+(25.5*a)-400;     units=PSTR("Kw"); break;
      case 43: v=b*0.1+(25.5*a);         units=PSTR("V"); break;
      case 44: /*sprintPSTR(buf, "%2d:%2d", a,b); t=String(buf);*/ break;
      case 45: v=0.1*a*b/100;            units=PSTR(" "); break;
      case 46: v=(a*b-3200)*0.0027;      units=PSTR("Deg k/w"); break;
      case 47: v=(b-128)*a;              units=PSTR("ms"); break;
      case 48: v=b+a*255;                units=PSTR(" "); break;
      case 49: v=(b/4)*a*0.1;            units=PSTR("mg/h"); break;
      case 50: v=(b-128)/(0.01*a);       units=PSTR("mbar"); break;
      case 51: v=((b-128)/255)*a;        units=PSTR("mg/h"); break;
      case 52: v=b*0.02*a-a;             units=PSTR("Nm"); break;
      case 53: v=(b-128)*1.4222+0.006*a;  units=PSTR("g/s"); break;
      case 54: v=a*256+b;                units=PSTR("count"); break;
      case 55: v=a*b/200;                units=PSTR("s"); break;
      case 56: v=a*256+b;                units=PSTR("WSC"); break;
      case 57: v=a*256+b+65536;          units=PSTR("WSC"); break;
      case 59: v=(a*256+b)/32768;        units=PSTR("g/s"); break;
      case 60: v=(a*256+b)*0.01;         units=PSTR("sec"); break;
      case 62: v=0.256*a*b;              units=PSTR("S"); break;
      case 64: v=float(a+b);             units=PSTR("Ohm"); break;
      case 65: v=0.01*a*(b-127);         units=PSTR("mm"); break;
      case 66: v=(a*b)/511.12;          units=PSTR("V"); break;
      case 67: v=(640*a)+b*2.5;         units=PSTR("Deg"); break;
      case 68: v=(256*a+b)/7.365;       units=PSTR("deg/s");break;
      case 69: v=(256*a +b)*0.3254;     units=PSTR("Bar");break;
      case 70: v=(256*a +b)*0.192;      units=PSTR("m/s^2");break;
      default: /*sprintPSTR(buf, "%2x, %2x      ", a, b);*/ break;
    }

    res.type = k;
    res.a = a;
    res.b = b;
    res.value = v;
    res.units = units;
    return res;
}

bool KWP::isConnected()
{
  return connected;
}

void KWP::obdWrite(uint8_t data)
{
  obd.write(data);
}

uint8_t KWP::obdRead()
{
  unsigned long timeout = millis() + 1000;
  while (!obd.available())
  {
    if (millis() >= timeout) 
    {
      disconnect();
      errorTimeout++;
      return 0;
    }
  }
  uint8_t data = obd.read();
  return data;
}

bool KWP::KWPSend(char *s, int size)
{
  for (int i=0; i < size; i++)
  {
    uint8_t data = s[i];
    obdWrite(data);
    if (i < size-1)
    {
      uint8_t complement = obdRead();
      if (complement != (data ^ 0xFF))
      {
        disconnect();
        errorData++;
        return false;
      }
    }
  }
  blockCounter++;
  return true;
}

bool KWP::KWPReceive(char s[], int maxsize, int &size, bool init_delay)
{
  bool ackeachbyte = false;
  uint8_t data = 0;
  int recvcount = 0;
  if (size == 0) ackeachbyte = true;
  if (size > maxsize)
  {
    return false;
  }
  unsigned long timeout = millis() + 2000;  // TODO: This allows connect to different Modules
  while ((recvcount == 0) || (recvcount != size))
  {
    while (obd.available())
    {
      data = obdRead();
      s[recvcount] = data;
      recvcount++;
      if ((size == 0) && (recvcount == 1))
      {
        size = data + 1;
        if (size > maxsize)
        {
          return false;
        }
      }
      if ((ackeachbyte) && (recvcount == 2))
      {
        if (data != blockCounter)
        {
          disconnect();
          errorData++;
          return false;
        }
      }
      if ( ((!ackeachbyte) && (recvcount == size)) ||  ((ackeachbyte) && (recvcount < size)))
      {
        obdWrite(data ^ 0xFF);
      }
      timeout = millis() + 1000;
    }
    if (millis() >= timeout)
    {
      disconnect();
      errorTimeout++;
      return false;
    }
  }
  blockCounter++;
  return true;
}

bool KWP::KWPSendAck()
{
  char buf[4] = { 0x03, blockCounter, 0x09, 0x03 };
  return KWPSend(buf, 4);
}
