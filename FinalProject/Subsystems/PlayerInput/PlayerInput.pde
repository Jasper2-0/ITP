import java.util.Iterator;

Player p;
Target t;
Arena a;


PShader lightShader;

boolean debug;

void setup() {
  size(1280, 720,P3D);
  p = new Player();
  t = new Target();
  a = new Arena(1920,1024,30,16);
  a.pos.x = 0;
  a.pos.y = 0;
  a.pos.z = 0;
  
}

void update() {
  p.update();
}


void draw() {

  background(0);
  update();
  lights();
  blendMode(ADD);
  a.draw();
  blendMode(NORMAL);
  p.draw();
  noFill();
  stroke(255,255,0);
  line(p.pos.x,p.pos.y,mouseX,mouseY);
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
    if (debug) {
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
