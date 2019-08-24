#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define OLED_RESET 4
Adafruit_SSD1306 display(OLED_RESET);

char * names[] = { "Average Consumption", "Instant Consumption", "Trip Distance", "Trip Time", "Speed" };
float values[] = { 0, 0, 0, 0, 0 };

int sel = 0;
float speed = 0;

ISR(TIMER1_OVF_vect)
{
  values[1] = 0; // get instant consumption in g/s and calc fuel
  values[0] += values[1] / (60 * 60);
  values[2] += speed / (60 * 60);
  values[3] += 1;
  values[4] = speed;
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
}

void loop()
{
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
