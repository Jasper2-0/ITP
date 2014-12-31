class Target extends Sprite {
  Target() {
    pos = new PVector();
  }
  
  void update() {
  
  }
  
  void draw() {
    pushMatrix();
    blendMode(NORMAL);
    translate(pos.x,pos.y);
    stroke(255,0,0);
    noFill();
    ellipse(0,0,20,20);
    popMatrix();
  }
}
