#include <SPI.h>
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

char * names[] = { "Instant Consumption", "Average Consumption", "Trip Distance", "Trip Time", "Speed", "Average Speed" };
float values[] = { 0, 0, 0, 0, 0, 0 };

int sel = 0;
float speed = 0;

ISR(TIMER1_OVF_vect)
{
  values[STAT_INST] = 0; // get instant consumption in g/s and calc fuel
  values[STAT_AVG] += values[1] / (60 * 60);
  values[STAT_DIST] += speed / (60 * 60);
  values[STAT_TIME] += 1;
  values[STAT_SPEED] = speed;
  values[STAT_AVGSPEED] = values[STAT_DIST] / values[STAT_TIME];
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
    }
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
