class Particle extends Sprite {

  PVector acc;
  PVector vel;

  ParticleParameters param;

  float age = 0;

  color startColor;
  color endColor;

  color colour;

  float mass;
  float friction;
  float lifespan;

  Particle(PVector pos, ParticleParameters pp) {

    this.mass = pp.mass;
    this.friction = pp.friction;
    this.lifespan = pp.lifespan;

    this.startColor = pp.startColor;
    this.endColor = pp.endColor;

    this.pos = pos.get();
    this.acc = new PVector (0, 0);
    this.vel = new PVector (random(-1, 1), random(-1, 1));

    vel.setMag(random(1, 10));
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acc.add(f);
  }

  void update() {
    
    vel.add(acc);
    vel.mult(friction);
    pos.add(vel);
    acc.mult(0);
    age += 1.0f;
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    strokeWeight(2);
    
    stroke(lerpColor(startColor, endColor, age/lifespan));
    line(0, 0, vel.x, vel.y);
    popMatrix();
  }

  boolean isDead() {
    if (age <= lifespan) {
      return false;
    } else {
      return true;
    }
  }
}

