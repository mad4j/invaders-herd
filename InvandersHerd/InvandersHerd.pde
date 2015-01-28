

final float GRC = 0.618033988749895; //golden_ratio_conjugate

float value = random(360);

void changeColor() {
    
  value += 360*GRC;
  value %= 360;
  
  stroke(value, 80, 80);
  fill(value, 80, 80);
}


void drawVader(int seed, int x, int y, int w, int h) {
 
  float dx = w / 5.0;
  float dy = h / 5.0;
  
  for (int i=0; i<5; i++) {
    
    if ((seed & 0x01) != 0) {
      rect(x, y+i*dy, dx, dy);
      rect(x+w-dx, y+i*dy, dx, dy);
    }
  
    if ((seed & 0x02) != 0) {
      rect(x+dx, y+i*dy, dx, dy);
      rect(x+w-2*dx, y+i*dy, dx, dy);
    }
  
    if ((seed & 0x04) != 0) {
      rect(x+2*dx, y+i*dy, dx, dy);
    }
  
    seed >>= 3;
  }
}

void setup() {
  
  size(600, 600);
  noLoop();
  
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  
  background(0, 0, 100);
  
  for (int i=0; i<24; i++) {
    for (int j=0; j<24; j++) {
      changeColor();
      drawVader((int)random(0xffff), i*25, j*25, 20, 20);
    }
  }
  
  //save("invaders-herd.png");
}

void keyPressed() {
  redraw();
}

void mousePressed() {
  redraw();
}
