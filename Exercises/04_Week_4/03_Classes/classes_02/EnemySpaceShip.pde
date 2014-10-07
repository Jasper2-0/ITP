class EnemySpaceShip {

  float _size = 20.0f;

  PVector _position;
  color _colour;

  boolean _visible = true;

  EnemySpaceShip(PVector position, color colour) {
    _position = position;
    _colour = colour;
  }

  void draw() {
    if (_visible) {    
      pushMatrix();
      translate(_position.x, _position.y);
      pushStyle();
      noStroke();
      fill(_colour);
      ellipse(0, 0, _size, _size);
      popStyle();
      popMatrix();
    }
  }
}

