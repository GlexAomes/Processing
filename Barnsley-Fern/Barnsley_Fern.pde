//https://en.wikipedia.org/wiki/Barnsley_fern
//float x = 0, y = 0;
PVector pt = new PVector(0, 0);
PVector[] fn = new PVector[4];
PVector clr = new PVector(255,0,0);
//0 = all green, 1 = indiv generations, 2 = random rainbow, 3 = rainbow gradient, else white
int cType = 3;

void setup() {
  size(600, 600);
  background(60);
  for (int i = 0; i < fn.length; i++) fn[i] = new PVector(); //init 
  stroke(255);
}

void getStrokeTypeTwo() {
  if (clr.x == 255 && clr.y != 255 && clr.z == 0) {
    clr.y++;
  }
  if (clr.x != 0 && clr.y == 255 && clr.z == 0) {
    clr.x--;
  }
  if (clr.x == 0 && clr.y == 255 && clr.z != 255) {
    clr.z++;
  }
  if (clr.x == 0 && clr.y != 0 && clr.z == 255) {
    clr.y--;
  } 
  if (clr.x != 255 && clr.y == 0 && clr.z == 255) {
    clr.x++;
  }
  if (clr.x == 255 && clr.y == 0 && clr.z != 0) {
    clr.z--;
  }
  stroke(clr.x, clr.y, clr.z);
}

void getStrokeTypeThree(float y) {
  //partition spaces for the combinations of min and max vals for R,G,B
  //partition those spaces for an increment from 0 to 255
  //Height = 600
  //6 combs of min/max => 3! = 6 => 100 pixels for range of 255, 2.55 per iter
  if (y > 500) {
    stroke(255, 255-(y%100)*2.55, 0);
  }
  if (y > 400 && y < 500) { 
    stroke((y%100)*2.55, 255, 0);
  }
  if (y > 300 && y < 400) {
    stroke(0, 255, 255-(y%100)*2.55);
  }
  if (y > 200 && y < 300) {
    stroke(0, (y%100)*2.55, 255);
  }
  if (y > 100 && y < 200) {
    stroke(255-(y%100)*2.55, 0, 255);
  }
  if (y > 0 && y < 100) {
    stroke(255, 0, (y%100)*2.55);
  }
}

void drawPoint() {
  if (cType == 0) stroke(8, 183, 53);
  if (cType == 2) getStrokeTypeTwo();
  strokeWeight(1);
  //Range: -2.1820 < x < 2.6558 /\ 0 <= y < 9.9983
  float px = map(pt.x, -2.1820, 2.6558, 0, width);
  float py = map(pt.y, 0, 9.9983, height, 0);
  if (cType == 3) getStrokeTypeThree(py);
  point(px, py); 
}

void nextPoint() {
  //f1
  fn[0].x = 0;
  fn[0].y = 0.16*pt.y;
  
  //f2
  fn[1].x = 0.85*pt.x + 0.04*pt.y;
  fn[1].y = -0.04*pt.x + 0.85*pt.y + 1.6;
  
  //f3
  fn[2].x = 0.2*pt.x - 0.26*pt.y;
  fn[2].y = 0.23*pt.x + 0.22*pt.y + 1.6;
  
  //f4
  fn[3].x = -0.15*pt.x + 0.28*pt.y;
  fn[3].y = 0.26*pt.x + 0.24*pt.y + 0.44; 
  
  float r = random(1);
  if (r < 0.01) { //Stem (between 0% and 1% chance = 1% chance)
    pt.x = fn[0].x;
    pt.y = fn[0].y;
    if (cType == 1) stroke(255);
  } else if (r < 0.86) { //Smaller leaflets (between 1% and 86% = 85% chance)
    pt.x = fn[1].x;
    pt.y = fn[1].y;
    if (cType == 1) stroke(0, 212, 255);
  } else if (r < 0.93) { //Largest left leaflet (between 86% and 93% = 7% chance)
    pt.x = fn[2].x;
    pt.y = fn[2].y;
    if (cType == 1) stroke(244, 65, 65);
  } else { //Largest right leaflet (between 93% and 100% = 7% chance)
    pt.x = fn[3].x;
    pt.y = fn[3].y; 
    if (cType == 1) stroke(66, 110, 244);
  }
}

void draw() {
  for (int i = 0; i < 100; i++) { //skip 100 iterations per frame
    drawPoint();
    nextPoint();
  }
}
