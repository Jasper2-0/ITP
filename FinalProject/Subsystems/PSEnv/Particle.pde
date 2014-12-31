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

    this.lifespan = pp.lifespan;

    this.pos = pos.get();
    this.vel = new PVector (random(-1, 1), random(-1, 1));

    vel.setMag(random(1, 10));
  }

  void update() { 
    pos.add(vel);
    if(pos.x <= 0 ||pos.x >= width) {
      vel.x = vel.x * -1.0f;
    }
    if(pos.y <= 0 || pos.y >= height) {
      vel.y = vel.y * -1.0f;
    }
    
    age += 1.0f;
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    strokeWeight(2);

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
    //noStroke();
    stroke(myCol);
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
