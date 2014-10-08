class Particle extends Sprite {

  PVector acc;
  PVector vel;

  ParticleParameters param;

  float age;

  Particle(PVector p, ParticleParameters pp) {

    param = pp;

    acc = new PVector (0, 0);
    vel = new PVector (random(-1, 1), random(-1, 1));
    vel.setMag(random(1, 10));
    pos = p.get();

    age = param.lifespan;
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(param.mass);
    acc.add(f);
  }

  void update() {
    vel.add(acc);
    vel.mult(0.985);
    pos.add(vel);
    acc.mult(0);
    age -= 1.0f;
  }

  void draw() {

    pushMatrix();
    translate(pos.x, pos.y);

    noFill();
//    strokeWeight(1);
    fill(param.startColor, map(age, param.lifespan, 0, 255, 128));
//   stroke(255, 64, 32, map(age, param.lifespan, 0, 255, 0));    

    //    ellipseMode(CENTER);
    float size = map(age, param.lifespan, 0, 10, 0);
    ellipse(0, 0, size, size);
   line(0, 0, vel.x, vel.y);
    popMatrix();
  }

  boolean isDead() {
    if (age <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

