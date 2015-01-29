
/**
 * Invaders Herd
 * Daniele Olmisani, 2015
 *
 * - daniele.olmisani@gmail.com
 * - https://github.com/mad4j/invaders-herd
 */


//golden_ratio_conjugate
final float GRC = 0.618033988749895; 

float value;

void changeColor() {
    
  value += 360*GRC;
  value %= 360;
  
  stroke(value, 80, 80);
  fill(value, 80, 80);
}


void drawInvader(int seed, int x, int y, int w, int h) {
 
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
  
  value = random(360);
}

void draw() {
  
  //white background
  background(0, 0, 100);
  
  for (int i=0; i<24; i++) {
    for (int j=0; j<24; j++) {
      changeColor();
      drawInvader((int)random(0xffff), i*25, j*25, 20, 20);
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
