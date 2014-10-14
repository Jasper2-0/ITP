interface Shape2D {
  boolean containsPoint(PVector p);
  float getArea();
  Circle getBoundingCircle();
  Rect getBounds();
  float getCircumfence();
  PVector getRandomPoint();
}
