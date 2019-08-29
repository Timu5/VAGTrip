#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include "KWP.h"

Adafruit_SSD1306 display(-1);

#define KLINE_RX 2
#define KLINE_TX 3
KWP kwp(KLINE_RX, KLINE_TX);

#define SELECT_BUTTON 5

#define SENSE_PIN 6
#define POWER_PIN 7

#define STAT_INST 0
#define STAT_AVG 1
#define STAT_DIST 2
#define STAT_TIME 3
#define STAT_SPEED 4
#define STAT_AVGSPEED 5
#define STAT_OIL 6

const char * names[] = { "Instant Consumption", "Average Consumption", "Trip Distance", "Trip Time", "Speed", "Average Speed", "Oil Change" };
float values[] = { 0, 0, 0, 0, 0, 0, 0 };
const char* units[] = { "L/KM", "L/KM", "KM", "S", "KM/H", "KM/H", "KM" };

int selected = 0;
float speed = 100;
float pw = 10;
float rpm = 3000;
float total_fuel = 0;

unsigned long press_time = 0;
int button = 0;

ISR(TIMER1_OVF_vect)
{
  double used_fuel = (pw * rpm * 320.0) / (1000.0 * 60); // per minut
  total_fuel += used_fuel / 60;
  if(speed < 10)
  {
    values[STAT_INST] = used_fuel * 60; // below 10kmh show l/h
    units[STAT_INST] = "L/H";
  }
  else
  {
    values[STAT_INST] = ((used_fuel * 0.001 * 60) * 100) / speed;
    units[STAT_INST] = "L/KM";
  }
  values[STAT_DIST] += speed / (60 * 60);
  values[STAT_AVG] = total_fuel * 0.1 / values[STAT_DIST];
  values[STAT_TIME] += 1;
  values[STAT_SPEED] = speed;
  values[STAT_AVGSPEED] = values[STAT_DIST] * 60 * 60 / values[STAT_TIME];
  values[STAT_OIL] -= speed / (60 * 60);
}

void setup()
{
  pinMode(POWER_PIN, OUTPUT);
  digitalWrite(POWER_PIN, HIGH);
  pinMode(SENSE_PIN, INPUT);

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

  if(values[STAT_OIL] <= 2000)
  {
    selected = STAT_OIL;
  }
}

void loop()
{
  if(digitalRead(SENSE_PIN) == LOW)
  {
    // power off
    display.ssd1306_command(SSD1306_DISPLAYOFF);
    digitalWrite(POWER_PIN, LOW);
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
        selected = (selected + 1) % 7;
      }
      button = 0;
      press_time = 0;
    }
  }

  if((button == 1) && (press_time != 0) && (millis() - press_time >= 2000UL))
  {
    // long press, reset
    if(selected < STAT_OIL)
    {
      values[STAT_AVG] = 0;
      values[STAT_DIST] = 0;
      values[STAT_TIME] = 0;
      total_fuel = 0;
    }
    else
    {
      values[STAT_OIL] = 15000; // oil change interval
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
      pw = resultBlock[2].valuef;
      rpm = resultBlock[0].valuef;
    }
  }

  display.clearDisplay();
	
  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.setCursor(0,0);
  display.print(names[selected]);
  
  display.drawLine(0, 14, 127, 14, WHITE);
  
  display.setTextSize(2);
  display.setTextColor(WHITE);
  display.setCursor(0, 20);
  if(selected == STAT_SPEED || selected == STAT_AVGSPEED  || selected == STAT_OIL)
  {
    display.print((int)values[selected]);
    display.print(units[selected]);
  }
  else if(selected == STAT_TIME)
  {
    int minuts = (int)(values[STAT_TIME] / 60);
    int seconds = values[STAT_TIME] - minuts * 60.0;
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
    display.print(values[selected]);
    display.print(units[selected]);
  }
 
  display.display();
  delay(1);
}
