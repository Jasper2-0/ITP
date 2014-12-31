class Enemy extends GameObject {
  String[] shapeData;

  float minSpeed = -7.5;
  float maxSpeed = 7.5;
  float speed = 0.0;
  float speedStep = 5.0;

  Enemy(float x, float y) {
    this.x = x;
    this.y = y;

    loadShape("enemy.txt");
    updateBounds();
  }

  void update() {
  }

  void draw() {
    pushMatrix();
    translate(this.x, this.y);
    stroke(#00FFFF);
    strokeWeight(2);

    beginShape();
    for (PVector p : points) {
      vertex(p.x, p.y);
    }
    endShape(CLOSE);
    if (debug) {
      drawDebug();
    }
    popMatrix();
  }
}

