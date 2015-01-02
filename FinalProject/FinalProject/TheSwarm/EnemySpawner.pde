class EnemySpawner extends GameObject {

  PVector acc;

  float maxSpeed;
  float maxForce;

  float wanderAngle;

  int emitFor;
  int emitRate;
  int emit = 0;

  boolean spawn = false;
  int spawnInterval = 300;

  EnemySpawner(float x, float y) {
    this.x = x;
    this.y = y;

    this.width = 10;
    this.height = 10;

    maxSpeed = 2;
    maxForce = 0.05;

    acc = new PVector(0, 0);
    vel = new PVector(0, -2);

    emitFor = 5;
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

    if (frameCount == 60) {
      spawn = true;
    }

    if (frameCount % spawnInterval == 0) {
      spawn = true;
    }
    if (spawn) {
      spawnEnemies();
    }
  }

  void spawnEnemies() {
    if (emit < emitFor) {
      if (frameCount % 10 == 0) {
        e = new Enemy(this.x, this.y);
        e.setArena(a);
        em.addEnemy(e);
        emit++;
      }
    } else {
      spawn = false;
      emit = 0;
    }
  }

  void applyBehaviors() {
    PVector avoidForce = avoid(bm.bullets);
    applyForce(avoidForce);
    applyForce(wander());
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
    if (spawn) {
      pushMatrix();
      translate(this.x, this.y);
      noFill();
      stroke(#FF00FF);
      ellipse(0, 0, 10, 10);
      ellipse(0, 0, 20, 20);
      ellipse(0, 0, 30, 30);

      if (debug) {
        drawDebug();
        text(a.getGlobalBounds().getRight(), this.width, this.height+40);
      }
      popMatrix();
    }
  }
}

