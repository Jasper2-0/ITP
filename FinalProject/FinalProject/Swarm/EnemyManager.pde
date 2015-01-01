class EnemyManager {
  ArrayList<Enemy>enemies;


  EnemySpawner es;
  GameObject a;

  int maxEnemies = 40;


  EnemyManager() {

    enemies = new ArrayList<Enemy>();
  }

  void update() {

    if (frameCount % 300 == 0) {
      es.emitFor = es.emitFor+5;
    }
    if (es.emitFor > maxEnemies) {
      es.emitFor = (int) random(5, maxEnemies/2);
    } 

    es.applyBehaviors();
    es.update();

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
        currentEnemy.remove();

        Score s = new Score(e.x, e.y);

        if (sm.addEnemyKill()) {
          s.scoreValue = "MULTIPLIER X"+sm.getMultiplier();
          s.lifespan = 60;
        } else {

          s.setScoreValue(sm.getScoreValue(100));
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

    es.draw();

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
}

