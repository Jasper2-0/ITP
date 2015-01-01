class BulletManager {

  ArrayList<Bullet> bullets;

  PVector bulletOrigin;
  PVector aim;

  GameObject a;

  int firingRate = 5;
  int firingMode = 1; // 0 = 1 bullet / 2 = 2 bullet etc

  float firingAngleOffset = 2.5;

  int shootCounter = 0;
  int collisionCount;

  boolean _fire;

  BulletManager() {
    this.bullets = new ArrayList<Bullet>();
    this.bulletOrigin = new PVector();
    this.aim = new PVector();
  }

  void update() {
    if (_fire) {
      if (shootCounter % firingRate == 0) {
        for (int i = 0; i< firingMode; i++) {

          float aimAngle = degrees(aim.heading());
          float start = (float) i * (firingMode*firingAngleOffset) / firingMode; 

          PVector newAim = PVector.fromAngle(radians(aimAngle+start));

          Bullet b = new Bullet(bulletOrigin.x, bulletOrigin.y, newAim);
          bullets.add(b);
        }
        resetCounter();
      }
      shootCounter += 1;
    }

    for (GameObject b : bullets) {
      b.update();

      boolean collide = false;
      PVector psOrigin = new PVector();
      float[] psDirection = new float[4];

      if (b.x >= a.getGlobalBounds().getRight()-b.width/2) {
        if (b.vel.x > 0) {
          collide = true;

          psOrigin.x = a.getGlobalBounds().getRight();
          psOrigin.y = b.y;

          psDirection[0] = -1.0;
          psDirection[1] = 0.0;
          psDirection[2] = -1.0;
          psDirection[3] = 1.0;
        }
      }
      if (b.x <= a.getGlobalBounds().getLeft()+b.width/2) {
        if (b.vel.x < 0) {
          collide = true;

          psOrigin.x = a.getGlobalBounds().getLeft();
          psOrigin.y = b.y;

          psDirection[0] = 0.0;
          psDirection[1] = 1.0;
          psDirection[2] = -1.0;
          psDirection[3] = 1.0;
        }
      }
      if (b.y >= a.getGlobalBounds().getBottom()-b.height/2) {
        if (b.vel.y > 0) {
          collide = true;

          psOrigin.x = b.x;
          psOrigin.y = a.getGlobalBounds().getBottom();

          psDirection[0] = -1.0;
          psDirection[1] = 1.0;
          psDirection[2] = -1.0;
          psDirection[3] = 0.0;
        }
      }
      if (b.y <= a.getGlobalBounds().getTop()+b.height/2) {
        if (b.vel.y < 0) {
          collide = true;

          psOrigin.x = b.x;
          psOrigin.y = a.getGlobalBounds().getTop();

          psDirection[0] = -1.0;
          psDirection[1] = 1.0;
          psDirection[2] = 0.0;
          psDirection[3] = 1.0;
        }
      }

      if (collide) {
        b.state = 1;
        pm.createSparks(psOrigin, psDirection);
      }

      // enemy collision detection

        ArrayList<PVector> gShape = b.getGlobalShape();
      for (Enemy e : em.enemies) {
        //collisionCount++;
        if (e.getGlobalBounds().intersectsRect(b.getGlobalBounds())) {
          for (PVector p : gShape) {
            if (e.containsPoint(p)) {
              b.state = 1;
              e.state = 1;
              collisionCount++;

              pm.createExplosion(new PVector(e.x, e.y));
            };
          }
        }
      }
    }

    for (int i =0; i<bullets.size (); i++) {
      if (bullets.get(i).state == 1) {
        bullets.remove(i);
      }
    }
    
    if(bullets.size() == 0) {
      collisionCount = 0;
    }
    
  }

  void draw() {
    for (Bullet b : bullets) {
      b.draw();
    }
  }

  int getBulletCount() {
    return bullets.size();
  }

  int getCollisionCount() {
    return this.collisionCount;
  }

  void resetCounter() {
    shootCounter = 0;
  }

  void setAim(PVector aim) {
    this.aim = aim;
  }

  void setArena(GameObject a) {
    this.a = a;
  } 

  void setBulletOrigin(PVector bulletOrigin) {
    this.bulletOrigin = bulletOrigin;
  }
}

