interface IParticle {
  
  void update();
  void draw();
  Particle copy();
  String toString();
  boolean isDead();
}

class Particle extends GameObject implements IParticle {

  float age;
  float lifespan;

  Particle() {
  }

  Particle(Particle p) {
    this.age = p.age;
    this.lifespan = p.lifespan;
  }

  Particle(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
  }

  void draw() {
  }

  boolean isDead() {
    if (age <= lifespan) {
      return false;
    } else {
      return true;
    }
  }

  Particle copy() {
    return new Particle();
  }

  String toString() {
    return "[Particle]";
  }
}

class ParticleExplosion extends Particle implements IParticle {
  ParticleExplosion(float x, float y, float lifespan) {
    super(x, y);

    this.age = 0.0;
    this.lifespan = lifespan;

    this.vel = new PVector (random(-1, 1), random(-1, 1));
    this.vel.setMag(random(1, 10));
  }

  ParticleExplosion(ParticleExplosion p) {
    this(p.x, p.y, p.lifespan);
  }

  void update() { 
    this.add(vel);
    age++;
  }

  void draw() {
    pushMatrix();
    translate(this.x, this.y);
    noFill();
    strokeWeight(2);

    color particleColor = color(#ffffff);

    float w = age/lifespan;

    if (w < 0.33) {
      particleColor = lerpColor(#FFFFFF, #00FFFF, map(w, 0.0, 0.33, 0.0, 1.0));
    }
    if (w > 0.33 && w < 0.66) {
      particleColor = lerpColor(#008888, #002222, map(w, 0.33, 0.66, 0.0, 1.0));
    }
    if (w > 0.66) {
      particleColor = lerpColor(#002222, #000000, map(w, 0.66, 1.0, 0.0, 1.0));
    }

    stroke(particleColor);
    line(0, 0, vel.x, vel.y);
    popMatrix();
  }

  ParticleExplosion copy() {
    return new ParticleExplosion(this);
  }

  String toString() {
    return "[ParticleExplosion]";
  }
}

class ParticleSpark extends Particle implements IParticle {

  float direction[];
  
  ParticleSpark(float x, float y, float lifespan, float[] direction) {
    super(x, y);

    this.age = 0.0;
    this.lifespan = lifespan;
    this.direction = direction;
    
    this.vel = new PVector (random(direction[0], direction[1]), random(direction[2], direction[3]));
    
    this.vel.setMag(random(1, 10));
  }

  ParticleSpark(ParticleSpark p) {
    this(p.x, p.y, p.lifespan,p.direction);
  }

  void update() { 
    this.add(vel);
    age++;
  }

  void draw() {
    pushMatrix();
    translate(this.x, this.y);
    noFill();
    strokeWeight(2);

    color particleColor = color(#ffffff);

    float w = age/lifespan;

    if (w < 0.5) {
      particleColor = lerpColor(#FFFFFF, #FFFF00, map(w, 0.0, 0.33, 0.0, 1.0));
    }
    if (w > 0.5) {
      particleColor = lerpColor(#FFFF00, #000000, map(w, 0.66, 1.0, 0.0, 1.0));
    }

    stroke(particleColor);
    line(0, 0, vel.x, vel.y);
    popMatrix();
  }

  ParticleSpark copy() {
    return new ParticleSpark(this);
  }

  String toString() {
    return "[ParticleSpark]";
  }
}
