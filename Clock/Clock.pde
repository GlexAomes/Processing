void setup() {
  size(400, 400);
}

void draw() {
  translate(200, 200);
  rotate(-PI/2);
  strokeWeight(8);
  color clr;
  
  int h = hour();
  int m = minute();
  int s = second();
  
  if (h >= 6 && h < 18) {
    clr = color(0);
    background(255);
  } else {
    clr = color(255);
    background(0);
  }
  
  push();
  rotate(PI/2);
  fill(clr);
  noStroke();
  textSize(20);
  text("12", -16, -160);
  text("6", -12, 175);
  text("9", -175, 8);
  text("3", 160, 8);
  pop();
  
  noFill();
  stroke(55, 94, 149);
  float arcS = map(s, 0, 60, 0, 2 * PI);
  arc(0, 0, 300, 300, 0, arcS);
  push();
  rotate(arcS);
  line(6, 0, 100, 0);
  pop();
  
  stroke(251, 101, 66);
  float arcM = map(m, 0, 60, 0, 2 * PI);
  arc(0, 0, 280, 280, 0, arcM);
  push();
  rotate(arcM);
  line(6, 0, 80, 0);
  pop();
  
  stroke(255, 187, 0);
  float arcH = map(h % 12, 0, 12, 0, 2 * PI);
  arc(0, 0, 260, 260, 0, arcH);
  push();
  rotate(arcH);
  line(6, 0, 60, 0);
  pop();
  
  stroke(clr);
  ellipse(0, 0, 5, 5);
}
