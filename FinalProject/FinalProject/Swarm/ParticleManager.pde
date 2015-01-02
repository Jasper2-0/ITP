class ParticleManager {
  ArrayList<ParticleSystem> psList;

  GameObject a;

  ParticleManager() {
    psList = new ArrayList<ParticleSystem>();
  }

  void update() {

    Iterator<ParticleSystem> currentPS = psList.iterator();
    while (currentPS.hasNext ()) {
      ParticleSystem ps = currentPS.next();
      ps.update();

      if (!ps.alive) {
        currentPS.remove();
      }
    }
  }

  void draw() {
    for (ParticleSystem ps : psList) {
      ps.draw();
    }
  }

  void setArena(GameObject a) {
    this.a = a;
  }

  GameObject getArena() {
    return a;
  }

  /*
  * Collision check for coliding with the arena
  */
  Particle collideArena(Particle p) {
    if (p.x <= this.a.getGlobalBounds().getLeft() ||p.x >= this.a.getGlobalBounds().getRight()) {
      p.vel.x = p.vel.x * -1.0f;
    }
    if (p.y <= this.a.getGlobalBounds().getTop() || p.y >= this.a.getGlobalBounds().getBottom()) {
      p.vel.y = p.vel.y * -1.0f;
    }
    
    return p;
    
  }

  void createSparks(PVector origin, float[] direction) {
    Particle sparkParticle = new ParticleSpark(origin.x, origin.y, 30.0, direction);
    ParticleSystem sparks = new ParticleSystem(origin.x, origin.y, sparkParticle  );

    sparks.emitFor = 5;
    sparks.emitRate = 5;

    this.addParticleSystem(sparks);
  }

  void createExplosion(PVector origin) {
    Particle explosionParticle = new ParticleExplosion(origin.x, origin.y, 60.0);
    ParticleSystem explosion = new ParticleSystem(origin.x, origin.y, explosionParticle);

    explosion.emitFor = 5;
    explosion.emitRate = 10;

    this.addParticleSystem(explosion);
  }

  void createPlayerExplosion(PVector origin) {
    Particle explosionParticle = new ParticleExplosion(origin.x, origin.y, 60.0);
    
    explosionParticle.player = true;
    
    ParticleSystem explosion = new ParticleSystem(origin.x, origin.y, explosionParticle);

    explosion.emitFor = 5;
    explosion.emitRate = 20;

    this.addParticleSystem(explosion);
  }


  void addParticleSystem(ParticleSystem ps) {
    psList.add(ps);
  }

  int getParticleSystemCount() {
    return psList.size();
  }
}

