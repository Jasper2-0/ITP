class Player extends GameObject {


  PVector aim;

  float minSpeed = -6.0;
  float maxSpeed = 6.0;
  float speed = 0.0;
  float speedStep = 3.0;

  boolean _up;
  boolean _down;
  boolean _left;
  boolean _right;

  float prevRotation = 0.0;
  float rotateStep = 7.5;

  ParticleExhaust  ep;
  ParticleSystem exhaust;

  int lives = 3;

  float maxForce = 0.1;

  int resetCounter = -1;
  int moveCounter = -1;

  Player(float x, float y) {

    this.x = x;
    this.y = y;

    loadShape("player.txt", points);
    updateBounds();

    ep = new ParticleExhaust(0.0, 0.0, 60.0, this.vel.heading());

    exhaust = new ParticleSystem(x+getExhaustOrigin().x, y+getExhaustOrigin().y, ep);


    exhaust.emitFor = 1;
    exhaust.emitRate = 5;
  }


  void update() {

    if (resetCounter > -1 ) {
      resetCounter--;
      if ( moveCounter > -1) {
        moveCounter--;
        _up = false;
        _down = false;
        _left=false;
        _right = false;
        bm._fire = false;
      }
    }

    if (moveCounter > 0) {
      PVector d = PVector.sub(center, this);

      d.div(moveCounter);
      this.add(d);
    }
    if (moveCounter == 0) {
      p.state = 0;
    }



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

    if (p.state == 0) {
      ArrayList<PVector> gShape = this.getGlobalShape();
      for (PowerUp pu : em.powerups) {

        if (pu.getGlobalBounds().intersectsRect(this.getGlobalBounds())) {
          for (PVector pPoint : gShape) {
            if (pu.containsPoint(pPoint)) {
              pu.state = 1;

              sm.addPowerUp();

              Score s = new Score(pu.x, pu.y);

              s.lifespan = 30;

              s.scoreValue = "POWER UP!";


              if (sm.getPowerUps() % 10 == 0) {
                s.scoreValue = "BOOM!";
                bm.firingMode++;
              }


              if (sm.getPowerUps() > 0 && sm.getPowerUps() % 5 == 0) {
                this.speedStep += 0.25;
                s.scoreValue = "SPEED";
              }

              sm.addScore(s);
            };
          }
        }
      }

      for (Enemy e : em.enemies) {
        if (e.getGlobalBounds().intersectsRect(this.getGlobalBounds())) {
          for (PVector pPoint : gShape) {
            if (e.containsPoint(pPoint)) {
              p.state = 1;
              e.state = 1;

              lives--;

              resetCounter = 180;
              moveCounter = 45;
              pm.createExplosion(new PVector(e.x, e.y));
            };
          }
        }
      }
    }


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

  int getLives() {
    return this.lives;
  }

  void addLife() {
      lives++;
  }

  void draw() {
    if (moveCounter == -1) {
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
    }
    /*
    pushMatrix();
     translate(exhaust.x, exhaust.y);
     exhaust.draw();    
     popMatrix();*/
  }
}

