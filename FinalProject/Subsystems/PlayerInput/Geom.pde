/*

A lot of what's going on here is inspired by Karsten Schmidt's toxiclibs core.geom.

*/

class Rect implements Shape2D {
  
  
  Rect() {
  
  }
  
  Rect(float x, float y, float width, float height) {
  
  }
  
  boolean containsPoint(PVector p) {
  
  }
  
  float getArea() {
  
  }
  
  Circle getBoundingCircle() {
  
  }
  
  Rect getBounds() {
  }
  
  float getCircumfence() {
  
  }
  PVector getRandomPoint() {
  
  }
}

class Circle implements Shape2D {

}


interface Shape2D {
  boolean containsPoint(PVector p);
  float getArea();
  Circle getBoundingCircle();
  Rect getBounds();
  float getCircumfence();
  PVector getRandomPoint();
}
