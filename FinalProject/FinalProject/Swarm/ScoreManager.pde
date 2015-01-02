class ScoreManager {


  ArrayList<Score> scoreList;

  long score;

  int enemyKills;
  int powerups;

  int multiplier = 1;

  int inc = 1;

  boolean upgrade;
  boolean done;

  ScoreManager() {
    this.score = 0;
    this.enemyKills = 0;
    this.powerups= 0;

    scoreList = new ArrayList<Score>();
  }

  void update() {
    Iterator<Score> currentScore = scoreList.iterator();
    while (currentScore.hasNext ()) {
      Score s = currentScore.next();
      s.update();

      if (s.isDead()) {
        currentScore.remove();
      }
    }
  }


  void draw() {
    Iterator<Score> currentScore = scoreList.iterator();
    while (currentScore.hasNext ()) {
      Score s = currentScore.next();
      s.draw();

      if (s.isDead()) {
        currentScore.remove();
      }
    }
  }

  void addPoints(int points) {
    this.score += (long) points*multiplier;
  }

  boolean addEnemyKill() {
    this.enemyKills++;

    if (enemyKills % pow(10, inc) == 0) {
      multiplier = multiplier * 2;
      inc += 1;

      return true;
    } else {
      return false;
    }
  }

  void addScore(Score s) {
    scoreList.add(s);
  }

  void addPowerUp() {
    this.powerups++;
  }

  int getMultiplier() {
    return multiplier;
  }

  int getScoreValue(int p) {
    return p*multiplier;
  }

  long getScore() {
    return score;
  };
  
  int getPowerUps() {
    return powerups;
  }

  int getEnemyKills() {
    return enemyKills;
  }
}

