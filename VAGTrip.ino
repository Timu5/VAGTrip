#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define OLED_RESET 4
Adafruit_SSD1306 display(OLED_RESET);

char * names[] = { "Average Consumption", "Instant Consumption", "Trip Distance", "Trip Time" };
float values[] = { 0, 0, 0, 0 };

int sel = 0;

void setup()
{
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
