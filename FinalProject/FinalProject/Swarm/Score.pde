class Score extends GameObject {
  
  String scoreValue = "";
  
  float age;
  float lifespan;
  
  Score(float x, float y){
    this.x = x;
    this.y = y;
    
    this.age = 0;
    this.lifespan = 30;
  }
  
  void update() {
    this.age++;
  }
  
    boolean isDead() {
    if (age <= lifespan) {
      return false;
    } else {
      return true;
    }
  }
  
  void setScoreValue(int s) {
    scoreValue = str(s);
  }
  
  void draw() {
    pushMatrix();
    translate(this.x,this.y);

    color textColor = color(#ffffff);

    float w = age/lifespan;

    if (w < 0.25) {
      textColor = lerpColor(#FFFFFF, #FFFF00, map(w, 0.0, 0.25, 0.0, 1.0));
    }
    if (w > 0.25 && w < 0.75) {
      textColor = lerpColor(#FFFF00, #FF0000, map(w, 0.25, 0.75, 0.0, 1.0));
    }
    if (w > 0.75) {
      textColor = lerpColor(#FF0000, #000000, map(w, 0.75, 1.0, 0.0, 1.0));
    }

    fill(textColor);
  
    textSize(24);
    text(scoreValue,0,0);
    fill(#FFFFFF);
    textSize(12);
    popMatrix();
  }
}
