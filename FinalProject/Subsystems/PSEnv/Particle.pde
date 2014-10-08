

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
    strokeWeight(3);

    color myCol = color(#ffffff);
    
    float w = age/lifespan;
    
    if(w < 0.33) {
      myCol = lerpColor(#FFFFFF,#FFFF00,map(w,0.0,0.33,0.0,1.0));
    }
    if(w > 0.33 && w < 0.66) {
      myCol = lerpColor(#FFFF00,#FF0000,map(w,0.33,0.66,0.0,1.0));
    }
    if(w > 0.66) {
      myCol = lerpColor(#FF0000,#000000,map(w,0.66,1.0,0.0,1.0));
    }
    
    //stroke(myCol);
    //line(0, 0, vel.x, vel.y);
    fill(myCol);
    ellipse(0,0,5,5);
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
