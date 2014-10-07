EnemySpaceShip e;


void setup() {
  size(640,640);
}

void draw() {
  background(0);
  for(int i = 0;i<5;i++) {
    for(int j = 0; j<4;j++) {
      e = new EnemySpaceShip(new PVector(320+i*20,320+j*20),#204080);
      e.draw();
    }
  }
}


