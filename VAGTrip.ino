#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define OLED_RESET 4
Adafruit_SSD1306 display(OLED_RESET);

#define SELECT_BUTTON 5

#define STAT_INST 0
#define STAT_AVG 1
#define STAT_DIST 2
#define STAT_TIME 3
#define STAT_SPEED 4
#define STAT_AVGSPEED 5
#define STAT_OIL 6

char * names[] = { "Instant Consumption", "Average Consumption", "Trip Distance", "Trip Time", "Speed", "Average Speed", "Oil Change" };
float values[] = { 0, 0, 0, 0, 0, 0, 0 };

int sel = 0;
float speed = 0;

int press_time = -1;

ISR(TIMER1_OVF_vect)
{
  values[STAT_INST] = 0; // get instant consumption in g/s and calc fuel
  values[STAT_AVG] += values[1] / (60 * 60);
  values[STAT_DIST] += speed / (60 * 60);
  values[STAT_TIME] += 1;
  values[STAT_SPEED] = speed;
  values[STAT_AVGSPEED] = values[STAT_DIST] / values[STAT_TIME];
  values[STAT_OIL] -= speed / (60 * 60);
}

void setup()
{
  noInterrupts();
  TCCR1A = 0;
  TCCR1B = 0;
  TCNT1 = 34286;
  TCCR1B |= (1 << CS12);
  TIMSK1 |= (1 << TOIE1);
  interrupts();

  display.begin(SSD1306_SWITCHCAPVCC, 0x3D);
  display.clearDisplay();
  display.display();

  pinMode(SELECT_BUTTON, INPUT_PULLUP);
}

void loop()
{
  if(digitalRead(SELECT_BUTTON) == LOW)
  {
    delay(50); // debounce
    if(digitalRead(SELECT_BUTTON) == LOW)
    {
      // button pressed
      sel = (sel + 1) % 7;
      press_time = millis();
    }
  }
  else
  {
    press_time = -1;
  }

  if(press_time != -1 && millis() - press_time >= 2000)
  {
    // long press, reset
    if(sel < STAT_OIL)
    {
      values[STAT_AVG] = 0;
      values[STAT_DIST] = 0;
      values[STAT_TIME] = 0;
    }
    else
    {
      values[STAT_OIL] = 15000; // oil change interval
    }
    press_time = -1;
  }

  display.clearDisplay();
	
  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.setCursor(0,0);
  display.println(names[sel]);
  
  display.drawLine(0, 20, 127, 20, WHITE);
  
  display.setTextSize(2);
  display.setTextColor(WHITE);
  display.setCursor(0, 20);
  display.println(values[sel]);
 
  display.display();
  delay(1);
}
