import java.util.Iterator;

class ParticleSystem extends Sprite {

  ArrayList<Particle> particles;

  PSParameters psp;

  int emitFor;
  int emitRate;
  int emit = 0;

  boolean alive;

  ParticleSystem(PVector pos, PSParameters psp) {
    this.pos = pos.get();
    this.psp = psp;

    if (psp.emitFor > 0) {
      this.emitFor = psp.emitFor;
    }

    if (psp.emitRate > 0) {
      this.emitRate = psp.emitRate;
    }
    
    particles = new ArrayList<Particle>();
    alive = true;
  }

  void emit() {
    if (emit < emitFor) {
      for (int i =0; i<emitRate; i++) {
        particles.add(new Particle(pos, psp.pp));
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

    if (particles.size() == 0) {
      if (psp.reset) {
        this.reset();
      } else {
        alive=false;
      }
    }
  }

  void reset() {
    emit = 0;
    pos = new PVector(random(width),random(height));
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
