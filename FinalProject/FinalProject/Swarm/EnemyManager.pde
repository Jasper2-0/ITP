class EnemyManager {
  ArrayList<Enemy>enemies;
  ArrayList<PowerUp>powerups;

  ArrayList<EnemySpawner> ess;

  EnemySpawner es;
  GameObject a;

  int maxEnemies = 40;


  EnemyManager() {

    enemies = new ArrayList<Enemy>();
    ess = new ArrayList<EnemySpawner>();
    powerups = new ArrayList<PowerUp>();
  }

  void update() {

    Iterator<PowerUp> currentPowerUp = powerups.iterator();
    while (currentPowerUp.hasNext ()) {
      PowerUp p = currentPowerUp.next();

      p.applyBehaviors();
      p.update();

      if (p.isDead() || p.state == 1) {
        currentPowerUp.remove();
      }
    }


    Iterator<EnemySpawner> currentEnemySpawner = ess.iterator();
    while (currentEnemySpawner.hasNext ()) {
      EnemySpawner ces = currentEnemySpawner.next();

      if (frameCount % 300 == 0) {
        ces.emitFor = ces.emitFor+5;
      }
      if (es.emitFor > maxEnemies) {
        ces.emitFor = (int) random(5, maxEnemies);
      } 

      ces.applyBehaviors();
      ces.update();
    }

    Iterator<Enemy> currentEnemy = enemies.iterator();
    while (currentEnemy.hasNext ()) {
      Enemy e = currentEnemy.next();



      if (frameCount % 60 == 0) {
        e.maxSpeed += 0.1;
      }

      e.applyBehaviors(enemies);
      e.update();

      em.collideArena(e);  

      if (e.state == 1) {
        addPowerUp(e.x, e.y);
        currentEnemy.remove();

        Score s = new Score(e.x, e.y);



        if (sm.addEnemyKill()) {
          s.scoreValue = "MULTIPLIER X"+sm.getMultiplier();
          s.lifespan = 60;
        } else {

          s.setScoreValue(sm.getScoreValue(100));
        }

        if (sm.getEnemyKills() > 0 && sm.getEnemyKills() % 25 == 0) {
          s.scoreValue = "EXTRA LIFE!";
          p.addLife();
        }

        sm.addScore(s);
        sm.addPoints(100);
      }
    }
  };


  Enemy collideArena(Enemy p) {
    if (p.x <= this.a.getGlobalBounds().getLeft() ||p.x >= this.a.getGlobalBounds().getRight()) {
      p.vel.x = p.vel.x * -1.0f;
    }
    if (p.y <= this.a.getGlobalBounds().getTop() || p.y >= this.a.getGlobalBounds().getBottom()) {
      p.vel.y = p.vel.y * -1.0f;
    }

    return p;
  }


  void draw() {

    Iterator<PowerUp> currentPowerUp = powerups.iterator();
    while (currentPowerUp.hasNext ()) {
      PowerUp p = currentPowerUp.next();

      p.draw();
    }


    Iterator<EnemySpawner> currentEnemySpawner = ess.iterator();
    while (currentEnemySpawner.hasNext ()) {
      EnemySpawner ces = currentEnemySpawner.next();
      ces.draw();
    }

    Iterator<Enemy> currentEnemy = enemies.iterator();
    while (currentEnemy.hasNext ()) {
      Enemy e = currentEnemy.next();
      e.draw();
    }
  }

  int getEnemyCount() {
    return enemies.size();
  }

  void addEnemy(Enemy e) {
    enemies.add(e);
  }

  void setArena(GameObject a) {
    this.a = a;
  }

  void setSpawner(EnemySpawner es) {
    this.es = es;
  }

  void addPowerUp(float x, float y) {
    PowerUp p = new PowerUp(x, y);
    p.setArena(a);
    powerups.add(p);
  }

  void addSpawner() {
    EnemySpawner newEs=new EnemySpawner(center.x, center.y);
    newEs.setArena(this.a);
    ess.add(newEs);
  }
}

