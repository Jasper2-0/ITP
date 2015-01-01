class Player extends GameObject {


  PVector aim;

  float minSpeed = -7.5;
  float maxSpeed = 7.5;
  float speed = 0.0;
  float speedStep = 5.0;

  boolean _up;
  boolean _down;
  boolean _left;
  boolean _right;

  float prevRotation = 0.0;
  float rotateStep = 7.5;

  ParticleExhaust  ep;
  ParticleSystem exhaust;


  Player(float x, float y) {

    this.x = x;
    this.y = y;

    loadShape("player.txt");
    updateBounds();

    ep = new ParticleExhaust(0.0, 0.0, 60.0, this.vel.heading());

    exhaust = new ParticleSystem(x+getExhaustOrigin().x, y+getExhaustOrigin().y, ep);


    exhaust.emitFor = 1;
    exhaust.emitRate = 5;
  }


  void update() {

    if (!_up || !_down) {
      exhaust.emitFor = 0;
    }
    if (_up || _down) {
      exhaust.reset();
      exhaust.emitFor = 1;
    }

    if (_up) {
      speed = speedStep;
    }
    if (_down) {
      speed = -speedStep;
    }

    // clip speed
    speed = min(max(speed, minSpeed), maxSpeed);

    // rotate orientation
    if (_left) {
      rotation -= rotateStep;
    }
    if (_right) {
      rotation += rotateStep;
    }

    aim = getAim();
    aim.mult(50);

    clipRotation();

    for (PVector p : points) {
      float rot = rotation - prevRotation;
      p.rotate(radians(rot));
    }   
    updateBounds();
    vel = fromAngle(radians(rotation));
    vel.mult(speed);

    if (this.x >= a.getGlobalBounds().getRight()-this.width/2) {
      x = a.getGlobalBounds().getRight()-this.width/2;
    }
    if (this.x <= a.getGlobalBounds().getLeft()+this.width/2) {
      x = a.getGlobalBounds().getLeft()+this.width/2;
    }
    if (this.y >= a.getGlobalBounds().getBottom()-this.height/2) {
      y = a.getGlobalBounds().getBottom()-this.height/2;
    }
    if (this.y <= a.getGlobalBounds().getTop()+this.height/2) {
      y = a.getGlobalBounds().getTop()+this.height/2;
    }

    this.add(vel);

    exhaust.x = x+getExhaustOrigin().x;
    exhaust.y = y+getExhaustOrigin().y;
    exhaust.update();


    // reset
    speed = 0.0;
    prevRotation = rotation;
  }

  PVector getAim() {
    PVector aim = PVector.sub(stageMouse, this);
    aim.normalize();
    return aim;
  }

  PVector getBulletOrigin() {
    PVector bo = getAim();
    bo.mult(25.0);
    bo.add(this);

    return bo;
  }

  PVector getExhaustOrigin() {
    return points.get(5);
  }


  void draw() {
    pushMatrix();
    translate(x, y);
    noFill();
    stroke(255);
    strokeWeight(2);

    beginShape();
    for (PVector p : points) {
      vertex(p.x, p.y);
    }
    endShape(CLOSE);

    noFill();
    stroke(255, 0, 0);
    ellipse(aim.x, aim.y, 5, 5);
    if (debug) {
      drawDebug();
    }
    popMatrix();
/*
    pushMatrix();
    translate(exhaust.x, exhaust.y);
    exhaust.draw();    
    popMatrix();*/
  }
}

