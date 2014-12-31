import java.util.Iterator;

PVector center;
PVector stageMouse;
PVector stageOffset;

Player p;
Arena a;
float arenaWidth = 1024;
float arenaHeight = 768;
int arenaRows = 32;
int arenaCols = 24;

Enemy e;

EnemyManager em;
BulletManager bm;
ParticleManager pm;

boolean debug = false;

void setup() {
  size(1280, 768, P3D);

  center = new PVector(width / 2.0, height / 2.0);
  stageMouse = new PVector(mouseX, mouseY);
  stageOffset = new PVector();

  // initialize Arena
  a = new Arena(arenaWidth, arenaHeight, arenaRows, arenaCols);
  a.x = center.x - a.width / 2;
  a.y = center.y - a.height / 2;

  // initalize ParticleSystemManager
  pm = new ParticleManager();
  pm.setArena(a);

  // initialize Player
  p = new Player(center.x, center.y-300);
  p.setArena(a);

  // initalize BulletManager
  bm = new BulletManager();  
  bm.setArena(a);

  // initalize EnemyManager
  em = new EnemyManager();

  for (int i = 0; i<10; i++) {
    for (int j = 0; j<10; j++) {

      // initalize Enemy
      e = new Enemy(center.x - (width / 4)+i*60, -150+ center.y+j*60);
      em.addEnemy(e);
    }
  }
}

void update() {
  // update the player
  p.update();

  stageOffset = PVector.sub(center, p);
  stageMouse = PVector.sub(new PVector(mouseX, mouseY), stageOffset);  

  // get the aim from the player (angle)
  bm.setAim(p.getAim());

  // get the origin coordinates from the player
  bm.setBulletOrigin(p.getBulletOrigin());

  // update enemy
  em.update();

  // update the bullet manager
  bm.update();

  // update the particle manager
  pm.update();
}

void draw() {
  background(0);

  update();
  pushMatrix();
  translate(stageOffset.x, stageOffset.y);

  blendMode(ADD);
  a.draw();
  pm.draw();

  blendMode(NORMAL);
  p.draw();
  em.draw();
  bm.draw();

  popMatrix();

  if (debug) {
    text("FPS: "+frameRate, 5, 12);
    text("BulletCount: "+bm.getBulletCount(), 5, 24);
    text("PSCount: "+pm.getParticleSystemCount(), 5, 36);
    text("BulletCollisionCount: "+bm.getCollisionCount(), 5, 48);
    text(stageMouse.toString(), 5, 60);
  }
}

void keyPressed() {
  if (key == 'w') {
    p._up = true;
  }
  if (key == 's') {
    p._down = true;
  }
  if (key == 'a') {
    p._left = true;
  }

  if (key == 'd') {
    p._right = true;
  }

  if (key =='§') {
    if (debug) {
      debug = false;
    } else {
      debug = true;
    }
  }
}
void keyReleased() {
  if (key == 'w') {
    p._up = false;
  }
  if (key == 's') {
    p._down = false;
  }
  if (key == 'a') {
    p._left = false;
  }

  if (key == 'd') {
    p._right = false;
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    bm._fire = true;
  }
  if (mouseButton == RIGHT) {
  }
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    bm._fire = false;
    bm.resetCounter();
  }
  if (mouseButton == RIGHT) {
  }
}
