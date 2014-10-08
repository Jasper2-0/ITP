
int levels = 9;
float branchLength = 120.0f;

void setup() {
  size(640, 640);
  noFill();
  stroke(#008000,192);
  background(255);
  drawTree(320, 640, -PI/2, levels,branchLength);
}

void draw() {
}


void drawTree(float x, float y, float a, int d, float branchLength) {
  if (d == 0) return;

  float x2 = x + cos(a) * random(0.5,1)*branchLength;
  float y2 = y + sin(a) * random(0.5,1)*branchLength;

  strokeWeight(d*2);
  line (x, y, x2, y2);
  drawTree(x2, y2, a - random(1)*(30*PI/180), d - 1,branchLength*0.86);
  drawTree(x2, y2, a + random(1)*(30*PI/180), d - 1,branchLength*0.86);
}
