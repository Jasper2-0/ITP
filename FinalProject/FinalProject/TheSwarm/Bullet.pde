class Bullet extends GameObject {

  PVector aim;

  float speed = 10.0;

  Bullet(float x, float y, PVector aim) {
    this.x = x;
    this.y = y;
    this.rotation = aim.heading();
    this.aim = aim;
    this.vel = new PVector();
    this.bounds = new Rect();

    points.add(new PVector(-10.0, -5.0));
    points.add(new PVector(10, 0.0));
    points.add(new PVector(-10, 5.0));

    for (PVector p : points) {
      p.rotate(rotation);
    }

    updateBounds();
  }

  void update() {
    vel.set(aim);
    vel.mult(speed);
    this.add(vel);
  }

  void draw() {
    pushMatrix();
    translate(x, y);
    noFill();
    stroke(255, 255, 0);
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

