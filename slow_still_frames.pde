import processing.serial.*;
Serial myPort;

PImage sprite;
String val;
boolean onoff = false;
int w = 125;
int counter = 0;
int x1;
int y1;
int count = 0;

void setup() {
  size(800,600);
  fill(255);
  sprite = loadImage("spritesheet.png");