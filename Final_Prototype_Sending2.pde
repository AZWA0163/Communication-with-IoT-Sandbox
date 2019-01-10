import nl.tue.id.oocsi.*;
OOCSI oocsi;

int EventType = 0;
int Led = 5;
int Value = 255;
int Chore1 = 2;

void setup() {
  // draw frame every ~3.3 secs
  size(500,500);
  frameRate(7);
  // connect to OOCSI server (event_generator = name of "sensor")
  oocsi = new OOCSI(this, "EventGenerator", "oocsi.id.tue.nl");
}

void draw() {
  if (keyPressed) {
    switch (key) {
      case '1': EventType = 1;
                break;
      case '2': EventType = 2;
                break;
      case '3': EventType = 3;
                break;
      case '4': EventType = 4;
                oocsi.channel("MODEL-HOUSE")
                     .data("Type" , "RGBLed")
                     .data("Board", 5)
                     .data("Index", 0) //0,1 ** 4 and 5
                     .data("Red",0)
                     .send();
                break;
      case '5': EventType = 5;
                oocsi.channel("MODEL-HOUSE")
                     .data("Type" , "RGBLed")
                     .data("Board", 5)
                     .data("Index", 1) //0,1 ** 4 and 5
                     .data("Red",0)
                     .send();
                break;
      case '6': EventType = 6;
                oocsi.channel("MODEL-HOUSE")
                     .data("Type" , "RGBLed")
                     .data("Board", 5)
                     .data("Index", 4) //0,1 ** 4 and 5
                     .data("Red",500)
                     .send();
                oocsi.channel("MODEL-HOUSE")
                     .data("Type" , "RGBLed")
                     .data("Board", 5)
                     .data("Index", 5) //0,1 ** 4 and 5
                     .data("Red",4000)
                     .send();
                break;
      case '7': EventType = 7;oocsi.channel("MODEL-HOUSE")
                     .data("Type" , "RGBLed")
                     .data("Board", 5)
                     .data("Index", 0) //0,1 ** 4 and 5
                     .data("Red",0)
                     .send();
                oocsi.channel("MODEL-HOUSE")
                     .data("Type" , "RGBLed")
                     .data("Board", 5)
                     .data("Index", 1) //0,1 ** 4 and 5
                     .data("Red",0)
                     .send();
               oocsi.channel("MODEL-HOUSE")
                     .data("Type" , "RGBLed")
                     .data("Board", 5)
                     .data("Index", 4) //0,1 ** 4 and 5
                     .data("Red",0)
                     .send();
                oocsi.channel("MODEL-HOUSE")
                     .data("Type" , "RGBLed")
                     .data("Board", 5)
                     .data("Index", 5) //0,1 ** 4 and 5
                     .data("Red",0)
                     .send();
                break;
      case '8': EventType = 8;
                oocsi.channel("MODEL-HOUSE")
                     .data("Type" , "RGBLed")
                     .data("Board", 5)
                     .data("Index", 4) //0,1 ** 4 and 5
                     .data("Red",3000)
                     .send();
                break;
      default : EventType = 0;
    }
    delay (50);
  // print to console
  println();
  print("Event value: " + EventType);

  oocsi.channel("ESP_OOCSI_event_Alan")
  .data("EventType", EventType)
  .data("Led", Led)
  .data("Value", Value)
  .send();  
  }
}
