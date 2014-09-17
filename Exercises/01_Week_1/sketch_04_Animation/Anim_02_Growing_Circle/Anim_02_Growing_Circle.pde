PVector c;
PVector p;
PVector c;

float rectSize = 50.0f;


void setup() {
  size(640, 640);

  c = new PVector(width / 2, height / 2);  
  p = new PVector(0, c.y);
}


void draw() {
  background(255);
  noStroke();
  fill(255, 0, 0);
  rectMode(CENTER);
  rect(p.x, p.y, rectSize, rectSize);

  p.x = p.x+1;

  if (p.x > width) {
    p.x = 0;
  }
}
float circleSize;
float maxSize;

void setup() {
  size(640, 640);

  c = new PVector(width/2, height/2);

  circleSize = 0.0f;
  maxSize = PVector.dist(c, new PVector(width, height));
}

void draw() {
  background(255);

  noStroke();
  fill(255, 0, 0);
  ellipseMode(RADIUS);
  ellipse(c.x, c.y, circleSize, circleSize);

  circleSize = circleSize+1;

  if (circleSize > maxSize) {
    circleSize = 0;
  }
}

