import java.util.Iterator;

class ParticleSystem extends Sprite {
  ArrayList<Particle> particles;

  ParticleParameters param;

  int emitFor= 5;
  int emit = 0;
  int emitRate = 20;

  ParticleSystem(PVector p, ParticleParameters pp) {
    pos = p.get();
    param = pp;
    particles = new ArrayList<Particle>();
  }

  void addParticle() {

    if (emit < emitFor) {
      for (int i =0; i<emitRate; i++) {
        particles.add(new Particle(pos, param));
      }
      emit++;
    }
  }

  void update() {
    Iterator<Particle> currentParticle = particles.iterator();

    while (currentParticle.hasNext ()) {
      Particle p = currentParticle.next();
      p.update();
      if (p.isDead()) {
        currentParticle.remove();
      }
    }
  }

  void draw() {
    for (Particle p : particles) {
      p.draw();
    }
  }

  void applyForce(PVector f) {
    for (Particle p : particles) {
      p.applyForce(f);
    }
  }
}


class Particle extends Sprite {

  PVector acc;
  PVector vel;

  ParticleParameters param;

  float age;

  Particle(PVector p, ParticleParameters pp) {

    param = pp;

    acc = new PVector (0, 0);
    vel = new PVector (random(-1, 1), random(-1, 1));
    vel.setMag(random(1,10));
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
    strokeWeight(1);
    //    fill(255, 64, 32, map(age, param.lifespan, 0, 255, 128));
    stroke(255, 64, 32, map(age, param.lifespan, 0, 255, 0));    

    //    ellipseMode(CENTER);
    float size = map(age, param.lifespan, 0, 10, 0);
    //    ellipse(0, 0, size, size);
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

class ParticleParameters {


  float mass;
  float lifespan;
  
  color startColor = #FF8040;
  color endColor = #000000;

  ParticleParameters() {
  }
}

