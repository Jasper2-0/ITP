PVector c;
PVector m;

void setup() {
  size(640, 640);
  c = new PVector(width/2, height/2);
}

void draw() {
  m = new PVector(mouseX, mouseY);

  PVector d = PVector.sub(c, m);

  background(255);
  noStroke();
  fill(255, 0, 0);
  ellipseMode(RADIUS);
  ellipse(c.x, c.y, d.mag(), d.mag());
}

