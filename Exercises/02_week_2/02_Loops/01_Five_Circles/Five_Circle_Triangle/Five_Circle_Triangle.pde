int numCirc = 6;

float ellipseSize = 35.0f;
float spacing = 40.0f;

float xPos;
float yPos;

float stackWidth;
float stackHeight;

PVector center;


void setup() {
  size(640, 640);
  center = new PVector(width/2, height/2);
  stackWidth = numCirc*(ellipseSize)+(numCirc-1)*spacing;
  stackHeight = numCirc*(ellipseSize)+(numCirc-1)*spacing;
}

void draw() {
  background(255);
  noStroke();
  fill(255, 0, 0);
  for (int i = 0; i<numCirc; i++) {
    for (int j = 0; j<i; j++) {
      xPos = center.x+j*(ellipseSize+spacing)-(stackWidth/2);
      yPos = center.y+i*(ellipseSize+spacing)-(stackHeight/2);
      ellipse(xPos, yPos, ellipseSize, ellipseSize);
    }
  }
}

