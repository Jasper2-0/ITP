EnemySpaceShip e;

int rows = 5;
int cols = 4;

ArrayList<EnemySpaceShip> enemies;

void setup() {
  size(640, 640);
  
  enemies = new ArrayList<EnemySpaceShip>();

  for (int i = 0; i<rows; i++) {
    for (int j = 0; j<cols; j++) {
      enemies.add(new EnemySpaceShip(#FFFF00, new PVector(320+i*20, 320+j*20)));
    }
  }
}

void draw() {
  background(0);
  for (EnemySpaceShip e : enemies) {
    e.draw();
  }
}


void mousePressed() {
  for(EnemySpaceShip e: enemies) {
    e.hit(mouseX,mouseY);
  }
}

