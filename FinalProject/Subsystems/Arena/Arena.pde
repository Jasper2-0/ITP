

void setup() {
  size(1280, 720, P3D);
}

void draw() {
  background(0);
  pushMatrix();
  translate(320, 32);
  
  noFill();
  stroke(#204080);
  blendMode(ADD);
  for (int i = 0; i<10; i++) {
    beginShape(QUAD_STRIP);
    for (int j = 0; j<11; j++) {
      vertex(j*64, i*64);
      vertex(j*64, (i+1)*64);
    }
    endShape();
  }
  popMatrix();
}

