float size = 50.0f;

float topSpeed = 5.0f;

PVector pos;
PVector acc;
PVector vel;

void setup() {
  size(640, 640);
  pos = new PVector(width/2, height/2);
  vel = new PVector(0, 0);
  acc = new PVector(0, 0);
}

void update() {

  PVector mouse = new PVector(mouseX, mouseY);
  PVector dir = PVector.sub(mouse, pos);

  dir.normalize();
  if (mousePressed) {
    dir.mult(-1);
  }

  dir.mult(0.5);    

  acc = dir;

  vel.add(acc);
  vel.limit(topSpeed);
  pos.add(vel);
}


void draw() {
  update();

  background(255);
  noStroke();
  fill(255, 255, 0);
  arc(pos.x, pos.y, size, size, PI/8, TWO_PI-PI/8);
}

