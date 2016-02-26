import processing.serial.*;
Serial myPort;

PImage sprite;
PImage activatedimage;
String val;
boolean onoff = false;
int w = 125;
int w2 = 180;
int w3 = 248;
int counter = 0;
int counter2 = 0;
int counter3 = 0;
int x1;
int y1;
int x2;
int y2;

void setup() {
  size(800,600);
  fill(255);
  sprite = loadImage("spritesheet.png");
  activatedimage = loadImage("runningsprite2.png");
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil(32);
}

void draw() {
  /* if (val != null) {
    val = trim(val);
    println("made it");
  } */
  
    if (onoff == false) {
    rect( 0, 0, 800, 600);
    x1 = (counter % 4) * w;
    y1 = (counter / 4) * w;
    copy(sprite, x1, y1, w, w, width/2, height/2, w, w);
    counter = counter + 1; 
    if (counter == 16) {
      counter = 0;
      }
    }
    else {
    rect(0, 0, 800, 600);
    x2 = (counter2 % 6) * w2;
    y2 = (counter3 % 2) * w3;
    copy(activatedimage, x2, y2, w2, w3, width/2, height/2, w2, w3);
    counter2 = counter2 + 1;
    if (counter2 == 100) {
      onoff = false;
      counter2 = 0;
      counter3 = counter3 + 1;
    }
    }
}

void serialEvent(Serial myPort) {
  val = myPort.readStringUntil(32);
  println(val);
  println("cleared");
  val = trim(val);
  if (val.equals("1")) {
    onoff = true;
  }
}

void mousePressed() {
  if (onoff == false) {
    onoff = true;
  } else onoff = false; 
}
    
  
    