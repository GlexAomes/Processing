Symbol rain[];

void setup() {
  int font = new Symbol(0).getFont();
  rain = new Symbol[width / font];
  for (int i = 0; i < rain.length; i++) {
    rain[i] = new Symbol(i * font);
  }
  
  fullScreen();
}

void draw() {
  background(0);
  
  for (int i = 0; i < rain.length; i++) {
    rain[i].update(frameCount);
    rain[i].show();
  }
}
