/*
* Most of this Rect class is quite liberally taken from toxiclibs' Rect class:
* http://hg.postspectacular.com/toxiclibs/src/44d9932dbc9f9c69a170643e2d459f449562b750/src.core/toxi/geom/Rect.java?at=default
*
* But reimplemented to use Processing's native PVector.
*/

class Rect extends PVector {
  float width;
  float height;

  Rect() {
  }

  Rect(float x, float y, float width, float height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  boolean containsPoint(PVector p) {
    float px = p.x;
    float py = p.y;

    if (px < x || px >= x + width) {
      return false;
    }
    if (py < y || py >= y + height) {
      return false;
    }

    return true;
  }

  float getBottom() {
    return this.y + this.height;
  }

  PVector getBottomLeft() {
    return new PVector(this.x, this.y + this.height);
  }

  PVector getBottomRight() {
    return new PVector(this.x + this.width, this.y + this.height);
  }
  
  Rect getBounds()  {
    return this;
  }
  
  float getLeft() {
    return this.x;
  }  
  
  float getRight() {
    return this.x + this.width;
  }
  
  float getTop() {
    return this.y;
  }
  
  PVector getTopLeft() {
    return new PVector(this.x, this.y);
  }
  
  PVector getTopRight() {
    return new PVector(this.x+width, this.y);
  }

  PVector getCenter() {
    return new PVector(x + width *0.5, y+height *0.5);
  }

  Rect growToContainPoint(PVector p) {
    if (!containsPoint(p)) {
      if (p.x < x ) {
        width = getRight() - p.x;
        x = p.x;
      } else if (p.x  > getRight() ) {
        width = p.x - x;
      }
      if (p.y < y) {
        height = getBottom() - p.y;
        y = p.y;
      } else if (p.y > getBottom()) {
        height = p.y - y;
      }
    }
    return this;
  }
  
  boolean intersectsRect(Rect r) {
    return !(this.x > r.x + r.width || this.x + this.width < r.x || this.y > r.y + r.height || this.y + this.height < r.y);
  }
   
  String toString() {
    return "[Rect: x:"+this.x+" y: "+this.y+" width: "+this.width+" height: "+this.height+"]";
  }
}

