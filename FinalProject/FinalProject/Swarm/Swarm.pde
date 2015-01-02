/*                                                               
 *                                                                
 *         ,----,                                                                                                ,---,  
 *       ,/   .`|                                                                                             ,`--.' |  
 *     ,`   .'  :  ,---,                        .--.--.                                               ____    |   :  :  
 *   ;    ;     /,--.' |                       /  /    '.                                           ,'  , `.  '   '  ;  
 * .'___,/    ,' |  |  :                      |  :  /`. /          .---.             __  ,-.     ,-+-,.' _ |  |   |  |  
 * |    :     |  :  :  :                      ;  |  |--`          /. ./|           ,' ,'/ /|  ,-+-. ;   , ||  '   :  ;  
 * ;    |.';  ;  :  |  |,--.   ,---.          |  :  ;_         .-'-. ' |  ,--.--.  '  | |' | ,--.'|'   |  ||  |   |  '  
 * `----'  |  |  |  :  '   |  /     \          \  \    `.     /___/ \: | /       \ |  |   ,'|   |  ,', |  |,  '   :  |  
 *     '   :  ;  |  |   /' : /    /  |          `----.   \ .-'.. '   ' ..--.  .-. |'  :  /  |   | /  | |--'   ;   |  ;  
 *     |   |  '  '  :  | | |.    ' / |          __ \  \  |/___/ \:     ' \__\/: . .|  | '   |   : |  | ,      `---'. |  
 *     '   :  |  |  |  ' | :'   ;   /|         /  /`--'  /.   \  ' .\    ," .--.; |;  : |   |   : |  |/        `--..`;  
 *     ;   |.'   |  :  :_:,''   |  / |        '--'.     /  \   \   ' \ |/  /  ,.  ||  , ;   |   | |`-'        .--,_     
 *     '---'     |  | ,'    |   :    |          `--'---'    \   \  |--";  :   .'   \---'    |   ;/            |    |`.  
 *               `--''       \   \  /                        \   \ |   |  ,     .-./        '---'             `-- -`, ; 
 *                            `----'                          '---"     `--`---'                                '---`"  
 *
 * The Swarm!, a heavily 'Geometry Wars' inspired 2D shooter with flocking and particles. 
 * Created by Jasper Schelling as part of the 'Introduction to Programming' course of the Mediatechnology MSc. Programme at Leiden University.
 *
 * How to play:
 * Steer your ship with W / A / S / D
 * You can aim using the mouse or your laptop's trackpad (this actually works better than I expected)
 *
 * The objective of the game is quite simple: DON'T DIE.
 * The swarm will spawn as you play. The longer you leave enemies allive, the faster they become.
 * as you kill enemies, you'll earn a score, and they'll drop green gems. Collect these gems to gain
 * power-ups (increase in ship speed, firing rate, and amount of bullets)
 *
 * How long can you hold out against The Swarm?
 *
 */

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
EnemySpawner es;

EnemyManager em;
BulletManager bm;
ParticleManager pm;

ScoreManager sm;

boolean debug = false;
boolean stats = false;


PFont f;
PFont ff;


void setup() {
  size(1280, 768, P3D);

  f = createFont("Gridnik.ttf", 32, true);
  ff = createFont("Gridnik.ttf", 128, true);

  textFont(f);


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
  p = new Player(center.x, center.y);
  p.setArena(a);

  // initalize BulletManager
  bm = new BulletManager();  
  bm.setArena(a);

  // initalize EnemyManager
  em = new EnemyManager();
  em.setArena(a);

  es = new EnemySpawner(center.x, center.y+300);
  es.setArena(a);

  em.setSpawner(es);

  em.addSpawner();
  // initalize ScoreManager

    sm = new ScoreManager();
}

void update() {
  // update the player
  p.update();

  stageOffset = PVector.sub(center, p);
  stageMouse = PVector.sub(new PVector(mouseX, mouseY), stageOffset);  
  if (p.lives > -1) {
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

    sm.update();

    if (frameCount % 3600 == 0) {
      em.addSpawner();
    }
  }
}

void draw() {
  background(0);
  update();

  pushMatrix();
  translate(stageOffset.x, stageOffset.y);

  blendMode(ADD);
  a.draw();
  pm.draw();
  sm.draw();

  if (p.lives > -1) {

    blendMode(NORMAL);
    p.draw();
    em.draw();
    bm.draw();
  } else {
    textFont(ff);
    fill(#00ff00);
    textSize(128);
    textAlign(CENTER);
    text("GAME OVER!", center.x, center.y);
  }
  popMatrix();


  fill(#00ff00);
  textAlign(LEFT);
  textSize(24);
  text("SCORE: "+sm.getScore(), 10, 36);
  text("LIVES: "+p.getLives(), 10, 60);

  if (stats) {
    textSize(12);
    text("FPS: "+frameRate, 5, 684);
    text("BulletCount: "+bm.getBulletCount(), 5, 696);
    text("PSCount: "+pm.getParticleSystemCount(), 5, 708);
    text("BulletCollisionCount: "+bm.getCollisionCount(), 5, 720);
    text("EnemyCount: "+em.getEnemyCount(), 5, 732);
    text("Score: "+sm.getScore(), 5, 744);
    text("EnemyKills: "+sm.getEnemyKills(), 5, 766);
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
  if (key == '1') {
    if (stats) {
      stats = false;
    } else {
      stats= true;
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

