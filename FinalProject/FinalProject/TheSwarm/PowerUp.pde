class PowerUp extends GameObject {

  ArrayList<PVector> pointsB;

  PVector acc;

  float maxSpeed;
  float maxForce;

  float wanderAngle;

  float age;
  float lifespan;

  PowerUp(float x, float y) {
    this.x = x;
    this.y = y;

    pointsB = new ArrayList<PVector>();

    loadShape("powerup_a.txt", points);
    loadShape("powerup_b.txt", pointsB);
    updateBounds();

    maxSpeed = 1;
    maxForce = 0.05;

    acc = new PVector(0, 0);
    vel = new PVector(0, -2);

    this.age = 0;
    this.lifespan = 180;
  }

  boolean isDead() {
    if (age <= lifespan) {
      return false;
    } else {
      return true;
    }
  }

  void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    this.add(vel);
    acc.mult(0);

    if (this.x >= a.getGlobalBounds().getRight()-this.width/2) {
      x = a.getGlobalBounds().getRight()-this.width/2;
    }
    if (this.x <= a.getGlobalBounds().getLeft()+this.width/2) {
      x = a.getGlobalBounds().getLeft()+this.width/2;
    }
    if (this.y >= a.getGlobalBounds().getBottom()-this.height/2) {
      y = a.getGlobalBounds().getBottom()-this.height/2;
    }
    if (this.y <= a.getGlobalBounds().getTop()+this.height/2) {
      y = a.getGlobalBounds().getTop()+this.height/2;
    }
    this.age++;
  }

  void applyBehaviors() {
    PVector avoidForce = avoid(bm.bullets);

    PVector pp = new PVector(p.x, p.y);

    PVector seekForce = seek(pp);
    seekForce.mult(1.0);
    
    applyForce(avoidForce);
    applyForce(wander());
    applyForce(seekForce);
  }

  void applyForce(PVector f) {
    acc.add(f);
  }




  PVector avoid(ArrayList<Bullet> bullets) {
    float desiredSeparation = this.height * 2;
    PVector sum = new PVector();

    int count = 0;
    for (GameObject b : bullets) {
      float d = PVector.dist(this, b);

      if (d > 0 && (d < desiredSeparation)) {
        PVector diff = PVector.sub(this, b);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      sum.normalize();
      sum.mult(maxSpeed);
      sum.sub(vel);
      sum.limit(maxForce);
    }
    return sum;
  }

  PVector wander() {
    float wanderRadius = 25;
    float wanderDistance = 80;
    float change = 0.3;

    wanderAngle += random(-change, change);

    PVector c = vel.get();
    c.normalize();
    c.mult(wanderDistance);
    c.add(this);

    float h = vel.heading2D();

    PVector cOffset = new PVector(wanderRadius*cos(wanderAngle+h), wanderRadius*sin(wanderAngle+h));
    PVector t = PVector.add(c, cOffset);

    return seek(t);
  }

  PVector seek(PVector target) {
    PVector d = PVector.sub(target, this);

    d.setMag(maxSpeed);

    PVector s = PVector.sub(d, vel);
    s.limit(maxForce);
    return s;
  }


  void draw() {
    pushMatrix();
    translate(x, y);
    noFill();

    float w = age/lifespan;

    color pColor = color(#ffffff);

    if (w < 0.1) {
      pColor = lerpColor(#FFFFFF, #00FF00, map(w, 0.0, 0.1, 0.0, 1.0));
    }
    if (w > 0.1 && w < 0.9) {
      pColor = lerpColor(#00FF00, #00FF00, map(w, 0.1, 0.9, 0.0, 1.0));
    }
    if (w > 0.9) {
      pColor = lerpColor(#00FF00, #000000, map(w, 0.9, 1.0, 0.0, 1.0));
    }


    stroke(pColor);
    strokeWeight(2);


    beginShape();
    for (PVector p : points) {
      vertex(p.x, p.y);
    }
    endShape(CLOSE);

    beginShape();
    for (PVector p : pointsB) {
      vertex(p.x, p.y);
    }
    endShape(CLOSE);

    popMatrix();
  }
}

