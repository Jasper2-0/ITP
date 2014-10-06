class Player extends Sprite {

  PVector acc;
  PVector vel;
  
  float minSpeed;
  float maxSpeed;

  float speed;

  boolean _left;
  boolean _right;
  boolean _up;
  boolean _down;

  Player() {

    pos = new PVector(width/2, 3*height/4);
    acc = new PVector(0, 0);
    vel = new PVector(0, 0);

    minSpeed = 3.0f;
    maxSpeed = 5.0f;

    speed = minSpeed;
     
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
    }
    if (_right) {
      acc.x = acc.x + speed;
    }

    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);


    if (pos.x < 0) {
      pos.x = 0;
    }
    if (pos.x > width) {
      pos.x = width;
    }

    if (pos.y < 0) {
      pos.y = 0;
    }

    if (pos.y > height) {
      pos.y = height;
    }

    acc.set(0, 0, 0);
    
  }
  
  void fire() {
  
  }

  void draw() {
    blendMode(NORMAL);
    pushMatrix();
    translate(pos.x, pos.y);
    rotateY(vel.x/maxSpeed);
    stroke(0);
    noStroke();
    fill(255);
    box(20, 40, 20);
    pushMatrix();
    translate(-15, 10);
    box(10,30,10);
    popMatrix();
    pushMatrix();
    translate(15, 10);
    box(10,30,10);
    popMatrix();
    pushMatrix();
    translate(0,10,20);
    popMatrix();
    popMatrix();
  }
}

