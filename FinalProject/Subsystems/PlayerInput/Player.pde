class Player extends Sprite {

  PVector acc;
  PVector vel;
  
  float minSpeed;
  float maxSpeed;

  float speed;
  
  float banking;
  float minBank;
  float maxBank;
  float bankStep;

  boolean rollBack;

  boolean _left;
  boolean _right;
  boolean _up;
  boolean _down;

  Player() {

    pos = new PVector(width/2, 3*height/4);
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);

    minSpeed = 9.0f;
    maxSpeed = 10.0f;

    speed = minSpeed;
     
     
    banking = 0.0f;
    minBank = -0.6f;
    maxBank = 0.6f;
    bankStep = 0.1f;
  }

  void update() {
    vel.set(0, 0, 0);

    if (_up) {
      acc.y = acc.y - speed;
    }
    if (_down) {
      acc.y = acc.y + speed;
    }
    if (_left) {
      acc.x = acc.x - speed;
      
      if(banking > minBank) {
        banking -= bankStep;
      }
    }
    if (_right) {
      acc.x = acc.x + speed;
      if (banking < maxBank) {
        
        banking += bankStep;
      }
    }
    
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);


    if (pos.x < 0) {
      pos.x = 0;
    }
    if (pos.x > 1920) {
      pos.x = 1920;
    }

    if (pos.y < 0) {
      pos.y = 0;
    }

    if (pos.y > 1024) {
      pos.y = 1024;
    }

   
   
   if (rollBack) {
      if(banking > 0.0f) {
        banking -= bankStep;
        if(banking <= 0.0f) {
          rollBack=false;
          banking = 0.0f;
        }
      } 
      if(banking < 0.0) {
        banking += bankStep;
        if(banking >=0.0) {
          rollBack = false;
          banking = 0.0f;
        }
      }
    }
    acc.set(0, 0, 0);
    
  }
  
  void fire() {
  
  }

  void draw() {
    blendMode(NORMAL);
    pushMatrix();
    pushStyle();
    translate(pos.x, pos.y);
    rotateY(banking);
    stroke(0);
    noStroke();
    fill(255);
    box(15, 30, 15);
    pushMatrix();
    translate(-11.25, 7.5);
    box(-7.5,22.5,7.5);
    popMatrix();
    pushMatrix();
    translate(11.25, 7,5);
    box(7.5,22.5,7.5);
    popMatrix();
    popStyle();
    popMatrix();
  }
}

