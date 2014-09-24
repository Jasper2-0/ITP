void setup() {
  size(640,640);
  background(255);
}

void draw() {
  noFill();
  stroke(0);
  if(mousePressed) {
    if (mouseButton == LEFT) {
      line(pmouseX,pmouseY,mouseX,mouseY);
    }
    // just some user-friendliness.
    if(mouseButton == RIGHT) {
      background(255);
    }
  }
}
