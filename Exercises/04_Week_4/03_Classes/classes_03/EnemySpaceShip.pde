class EnemySpaceShip {

  float size = 20.0f;

  PVector position;
  color colour;

  boolean visible = true;

  EnemySpaceShip() {
  }

  EnemySpaceShip(color colour) {
    this.colour = colour;
  }

  EnemySpaceShip(color colour, PVector position) {
    this.position = position;
    this.colour = colour;
  }

  void draw() {
    if (visible) {    
      pushMatrix();
      translate(position.x, position.y);
      pushStyle();
      noStroke();
      fill(colour);
      ellipse(0, 0, size, size);
      popStyle();
      popMatrix();
    }
  }

  void hit(int x, int y) {
    float rad = size / 2.0f;
    float squareDist = pow((position.x-x), 2) + pow((position.y-y), 2);

    if (squareDist <=pow(rad, 2)) {
      if (visible) {
        visible = false;
      } else {
        visible = true;
      }
    }
  }
}

