#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <EEPROM.h>
#include "KWP.h"

#define SPEED_PIN 3

#define SELECT_BUTTON 5

#define SENSE_PIN 6
#define POWER_PIN 7
//8, 9 reserved for mode and reset

#define KLINE_RX 10
#define KLINE_TX 11

#define STAT_INST 0
#define STAT_AVG 1
#define STAT_DIST 2
#define STAT_TIME 3
#define STAT_SPEED 4
#define STAT_AVGSPEED 5
#define STAT_OIL 6

struct TripC
{
  uint8_t selected = 0;
  float speed = 100;
  float pw = 10;
  float rpm = 3000;
  float total_fuel = 0;
  float values[7];
};

Adafruit_SSD1306 display(-1);
KWP kwp(KLINE_RX, KLINE_TX);

TripC trip;
const char * names[] = { "Instant Consumption", "Average Consumption", "Trip Distance", "Trip Time", "Speed", "Average Speed", "Oil Change" };
const char* units[] = { "L/KM", "L/KM", "KM", "S", "KM/H", "KM/H", "KM" };

unsigned long press_time = 0;
int button = 0;

unsigned long last_speed_rise = 0;
const float speed_const = 200;
const float fuel_const = 320.0;

ISR(TIMER1_OVF_vect)
{
  double used_fuel = (trip.pw * trip.rpm * fuel_const) / (1000.0 * 60); // per minut
  trip.total_fuel += used_fuel / 60;
  if(trip.speed < 10)
  {
    trip.values[STAT_INST] = used_fuel * 60; // below 10kmh show l/h
    units[STAT_INST] = "L/H";
  }
  else
  {
    trip.values[STAT_INST] = ((used_fuel * 0.001 * 60) * 100) / trip.speed;
    units[STAT_INST] = "L/KM";
  }
  trip.values[STAT_DIST] += trip.speed / (60 * 60);
  trip.values[STAT_AVG] = trip.total_fuel * 0.1 / trip.values[STAT_DIST];
  trip.values[STAT_TIME] += 1;
  trip.values[STAT_SPEED] = trip.speed;
  trip.values[STAT_AVGSPEED] = trip.values[STAT_DIST] * 60 * 60 / trip.values[STAT_TIME];
  trip.values[STAT_OIL] -= trip.speed / (60 * 60);
}

void speed_int()
{
  if(last_speed_rise != 0)
  {
    // calc speed
    unsigned long time = millis() - last_speed_rise;
    trip.speed = speed_const / time;
  }
  last_speed_rise = millis();
}

void setup()
{
  pinMode(POWER_PIN, OUTPUT);
  digitalWrite(POWER_PIN, HIGH);
  pinMode(SENSE_PIN, INPUT_PULLUP);

  EEPROM.get(0, trip);

  pinMode(SPEED_PIN, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(SPEED_PIN), speed_int, RISING);

  noInterrupts();
  TCCR1A = 0;
  TCCR1B = 0;
  TCNT1 = 34286;
  TCCR1B |= (1 << CS12);
  TIMSK1 |= (1 << TOIE1);
  interrupts();

  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
  display.clearDisplay();
  display.display();

  pinMode(SELECT_BUTTON, INPUT_PULLUP);

  if(trip.values[STAT_OIL] <= 1000)
  {
    trip.selected = STAT_OIL;
  }
}

void loop()
{
  if(digitalRead(SENSE_PIN) == LOW)
  {
    // power off
    display.ssd1306_command(SSD1306_DISPLAYOFF);
    digitalWrite(POWER_PIN, LOW);
    EEPROM.put(0, trip);
    while(1);
  }

  if(digitalRead(SELECT_BUTTON) == LOW && button == 0)
  {
    delay(50); // debounce
    if(digitalRead(SELECT_BUTTON) == LOW)
    {
      // button pressed
      press_time = millis();
      button = 1;
    }
  }
  else if(digitalRead(SELECT_BUTTON) == HIGH && button == 1)
  {
    delay(50); // debounce
    if(digitalRead(SELECT_BUTTON) == HIGH)
    {
      if(press_time != 0)
      {
        trip.selected = (trip.selected + 1) % 7;
      }
      button = 0;
      press_time = 0;
    }
  }

  if((button == 1) && (press_time != 0) && (millis() - press_time >= 2000UL))
  {
    // long press, reset
    if(trip.selected < STAT_OIL)
    {
      trip.values[STAT_AVG] = 0;
      trip.values[STAT_DIST] = 0;
      trip.values[STAT_TIME] = 0;
      trip.total_fuel = 0;
    }
    else
    {
      trip.values[STAT_OIL] = 15000; // oil change interval
    }
    press_time = 0;
  }

  if(!kwp.isConnected())
  {
    if(!kwp.connect(ADR_Engine, 10400))
    {
      // can't connect to ecu
    }
  }
  else
  {
    KWPSensor resultBlock[4];
    int nSensors = kwp.readBlock(ADR_Engine, 2, 4, resultBlock);
    if(nSensors == 4)
    {
      trip.pw = resultBlock[2].valuef;
      trip.rpm = resultBlock[0].valuef;
    }
  }

  display.clearDisplay();
	
  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.setCursor(0,0);
  display.print(names[trip.selected]);
  
  display.drawLine(0, 14, 127, 14, WHITE);
  
  display.setTextSize(2);
  display.setTextColor(WHITE);
  display.setCursor(0, 20);
  if(trip.selected == STAT_SPEED || trip.selected == STAT_AVGSPEED  || trip.selected == STAT_OIL)
  {
    display.print((int)trip.values[trip.selected]);
    display.print(units[trip.selected]);
  }
  else if(trip.selected == STAT_TIME)
  {
    int minuts = (int)(trip.values[STAT_TIME] / 60);
    int seconds = trip.values[STAT_TIME] - minuts * 60.0;
    if(minuts < 10)
      display.print('0');
    display.print(minuts);
    display.print(':');
    if(seconds < 10)
      display.print('0');
    display.print(seconds);
  }
  else
  {
    display.print(trip.values[trip.selected]);
    display.print(units[trip.selected]);
  }
 
  display.display();
  delay(1);
}
