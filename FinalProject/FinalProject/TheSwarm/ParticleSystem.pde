class ParticleSystem extends GameObject {

  boolean alive;
  ArrayList<Particle> particles;

  int emitFor;
  int emitRate;
  int emit = 0;

  Particle op;

  ParticleSystem(float x, float y, Particle p) {
    this.x = x;
    this.y = y;

    this.op = p;
    particles = new ArrayList<Particle>();
    alive = true;
  }

  void update() {

    if (emit < emitFor) {
      for (int i =0; i<emitRate; i++) {
        Particle p = op.copy();
        particles.add(p);
      }
      emit++;
    }

    Iterator<Particle> currentParticle = particles.iterator();
    while (currentParticle.hasNext ()) {
      Particle p = currentParticle.next();
      p.update();
      pm.collideArena(p);    

      if (p.isDead()) {
        currentParticle.remove();
      }
    }

    if (particles.size() == 0) {
      alive=false;
    }
  }

  void reset() {
    emit = 0;
  }

  void draw() {
    for (Particle p : particles) {
      p.draw();
    }
  }
  
  String toString() {
    return "[Particle System] "+op.toString();
  }
}
