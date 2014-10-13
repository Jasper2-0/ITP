import java.util.Iterator;

Player p;
Arena a;

PShader lightShader;

boolean debug;

void setup() {
  size(1280, 720, P3D);
  p = new Player();
  a = new Arena(1920,1024,30,16);
  a.pos.x = 0;
  a.pos.y = 0;
  a.pos.z = -20;
  lightShader = loadShader("shaders/fs_ppl.glsl", "shaders/vs_ppl.glsl");
  
  printCamera();
}

void update() {
  p.update();
}


void draw() {

  background(0);
  update();
  lights();
  camera(p.pos.x,p.pos.y,(height/2.0) / tan(PI*30.0 / 180.0),p.pos.x,p.pos.y,0,0,1,0);
  blendMode(ADD);
  a.draw();
  blendMode(NORMAL);
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

