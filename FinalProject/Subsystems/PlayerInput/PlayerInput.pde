Player p;

void setup() {
  size(480, 640, P3D);
  p = new Player();
}

void update() {
  p.update();
}


void draw() {

  background(0);
  update();
  lights();
  p.draw();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      p._up = true;
    }
    if (keyCode == DOWN) {
      p._down = true;
    }
    if (keyCode == LEFT) {
      p._left = true;
    }
    if (keyCode == RIGHT) {
      p._right = true;
    }
  }
  if (key == ' ') {
    p.fire();
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) {
      p._up = false;
    }
    if (keyCode == DOWN) {
      p._down = false;
    }
    if (keyCode == LEFT) {
      p._left = false;
    }
    if (keyCode == RIGHT) {
      p._right=false;
    }
  }
}

