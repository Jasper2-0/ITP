class EnemyManager {
  ArrayList<Enemy>enemies;

  GameObject a;


  EnemyManager() {

    enemies = new ArrayList<Enemy>();
  }

  void update() {
    Iterator<Enemy> currentEnemy = enemies.iterator();
    while (currentEnemy.hasNext ()) {
      Enemy e = currentEnemy.next();
      e.applyBehaviors(enemies);
      e.update();
      e.borders();
      
      
      
      
      if(e.state == 1) {
        currentEnemy.remove();
      }
    }
  };

  void draw() {
    Iterator<Enemy> currentEnemy = enemies.iterator();
    while (currentEnemy.hasNext ()) {
      Enemy e = currentEnemy.next();
      e.draw();
    }
  }

  void addEnemy(Enemy e) {
    enemies.add(e);
  }

  void setArena(GameObject a) {
    this.a = a;
  }
}

