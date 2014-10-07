Player p;

boolean debug;

void setup() {
  size(1280, 720, P3D);
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

void debugDraw() {

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
  if (key == '§') {
    if(debug) {
      debug = false;
    } else {
      debug = true;
    }
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
      p.rollBack = true;
      
    }
    if (keyCode == RIGHT) {
      p._right=false;
      p.rollBack = true;
    }
  }
}

