/*
* The flocking behaviour was adapted from Daniel Shifman's book 'The Nature of Code' 
 * http://natureofcode.com/book/chapter-6-autonomous-agents/
 */

class Enemy extends GameObject {
  String[] shapeData;

  PVector acc;

  float maxSpeed;
  float maxForce;

  float seperationMultiplier = 1.0;
  float alignmentMultiplier = 1.0;
  float cohesionMultiplier = 0.5;
  float seekMultiplier = 1.0;

  Enemy(float x, float y) {
    this.x = x;
    this.y = y;

    acc = new PVector(0, 0);
    vel = new PVector(0, -2);

    maxSpeed = 4;
    maxForce = 0.1;

    loadShape("enemy.txt");
    updateBounds();
  }

  void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    this.add(vel);
    acc.mult(0);
  }

  void applyForce(PVector f) {
    acc.add(f);
  }

  void borders() {
    PVector d = null;
    if (this.x >= a.getGlobalBounds().getRight()-this.width) {
      d = new PVector(-maxSpeed, vel.y);
    }

    if (this.x <= a.getGlobalBounds().getLeft()+this.width) {
      d = new PVector(maxSpeed,vel.y);
    }
    if (this.y >= a.getGlobalBounds().getBottom()-this.height) {
      d = new PVector(vel.x,-maxSpeed);
    }
    if (this.y <= a.getGlobalBounds().getTop()+this.height) {
      d = new PVector(vel.x,maxSpeed);
    }
    
    if (d!= null) {
      d.normalize();
      d.mult(maxSpeed);
      PVector s = PVector.sub(d,vel);
      s.limit(maxForce);
      applyForce(s);
    }
  }


  void applyBehaviors(ArrayList<Enemy> enemies) {
    PVector sepForce = seperate(enemies);
    PVector alignForce = align(enemies);
    PVector cohesionForce = cohesion(enemies);
    PVector seekForce = seek(p);

    sepForce.mult(1.0);
    alignForce.mult(1.0);
    cohesionForce.mult(0.5);
    seekForce.mult(1.0);

    applyForce(sepForce);
    applyForce(alignForce);
    applyForce(cohesionForce);
    applyForce(seekForce);
  }

  PVector seek(PVector target) {
    PVector d = PVector.sub(target, this);

    d.setMag(maxSpeed);

    PVector s = PVector.sub(d, vel);
    s.limit(maxForce);
    return s;
  }


  PVector seperate(ArrayList<Enemy> enemies) {
    float desiredSeparation = this.height * 2;
    PVector sum = new PVector();

    int count = 0;
    for (GameObject e : enemies) {
      float d = PVector.dist(this, e);

      if (d > 0 && (d < desiredSeparation)) {
        PVector diff = PVector.sub(this, e);
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

  PVector align(ArrayList<Enemy> enemies) {
    float neighborDistance = 50;
    PVector sum = new PVector(0, 0);

    int count = 0;

    for (Enemy otherEnemy : enemies) {

      float d = PVector.dist(this, otherEnemy);

      if ((d>0) && (d < neighborDistance)) {
        sum.add(otherEnemy.vel);
        count++;
      }
    }

    if (count > 0) {
      sum.div((float) count);
      sum.normalize();
      sum.mult(maxSpeed);
      PVector steer = PVector.sub(sum, vel);
      steer.limit(maxForce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  PVector cohesion(ArrayList<Enemy> enemies) {
    float neighborDistance = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Enemy otherEnemy : enemies) {
      float d = PVector.dist(this, otherEnemy);

      if ((d > 0) && (d < neighborDistance)) {
        sum.add(otherEnemy);
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);
    } else {
      return new PVector(0, 0);
    }
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

