int numCirc = 5;


float ellipseSize = 35.0f;
float spacing = 40.0f;

float xPos;
float stackWidth;

PVector center;


void setup() {
  size(640, 640);
  center = new PVector(width/2, height/2);
  stackWidth = numCirc*(ellipseSize)+(numCirc-1)*spacing;
}

void draw() {
  background(255);
  noStroke();
  fill(255, 0, 0);
  for (int i = 0; i<numCirc; i++) {
    xPos = center.x+i*(ellipseSize+spacing)-(stackWidth/2);
    ellipse(xPos, center.y, ellipseSize, ellipseSize);
  }
}

