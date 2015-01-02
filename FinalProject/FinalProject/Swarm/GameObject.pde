class GameObject extends PVector {
  float width;
  float height;

  int state = 0; // 0 = in play // 1 = to be removed // 2 = dying etc

  ArrayList<PVector> points;

  
  String[] shapeData;
  Rect bounds;

  float rotation = 0.0; // in degrees!

  PVector vel;

  GameObject a; // ARENA

  GameObject() {
    bounds = new Rect();
    points = new ArrayList<PVector>();
    vel = new PVector();
  }

  void clipRotation() {
    // wraparound rotation
    if (rotation < 0.0) {
      rotation = 360.0 + rotation;
    }
    if (rotation > 360.0) {
      rotation = rotation - 360.0;
    }
  }

  void loadShape(String filename, ArrayList<PVector> target) {

    shapeData = loadStrings(filename);
    for (int i = 0; i<shapeData.length; i++) {
      String[] cells = shapeData[i].split(",");
      float sx = parseFloat(cells[1]);
      float sy = parseFloat(cells[2]);
      target.add(new PVector(sx, sy));
    }
  }

  void update() {
  }

  void updateBounds() {
    this.bounds = new Rect();
    for (PVector p : points) {
      bounds.growToContainPoint(p);
    }
    this.width = bounds.width;
    this.height = bounds.height;
  }

  void drawDebug() {
    drawBounds();
    drawCenter();

    float debugX = bounds.getBottomRight().x;
    float debugY = bounds.getBottomRight().y;

    text("x: "+x, debugX, debugY);
    text("y: "+y, debugX, debugY+15);
    
    boolean inShape = containsPoint(stageMouse);
    
    text("containsPoint: "+inShape,debugX,debugY+30);
    
  }

  void drawBounds() {
    noFill();
    strokeWeight(1);
    stroke(255, 0, 0);
    rect(bounds.x, bounds.y, bounds.width, bounds.height);
  }

  void drawCenter() {
    noFill();
    strokeWeight(1);
    stroke(255);
    line(-3, 0, 3, 0);
    line(0, -3, 0, 3);
  }


  void setArena(GameObject a) {
    this.a = a;
  }

  boolean containsPoint(PVector p) {
    
    ArrayList<PVector> gShape = this.getGlobalShape();
    
    int num = gShape.size();
    int i, j  = num - 1;

    boolean contains = false;

    float px = p.x;
    float py = p.y;

    for (i=0; i<num; i++) {
      PVector pi = gShape.get(i);
      PVector pj = gShape.get(j);

      if (pi.y < py && pj.y >= py || pj.y < py && pi.y >= py) {
        if (pi.x + (py -pi.y) / (pj.y - pi.y) * (pj.x - pi.x) < px) {
          contains = !contains;
        }
      }
      j = i;
    }
    return contains;
  } 

  Rect getLocalBounds() {
    return bounds;
  }
  Rect getGlobalBounds() {
    return new Rect(this.x+bounds.x, this.y+bounds.y, bounds.width, bounds.height);
  }
  
  ArrayList<PVector> getLocalShape() {
    return new ArrayList<PVector>(points);
  }
  ArrayList<PVector> getGlobalShape() {
    ArrayList<PVector> globalShape = new ArrayList<PVector>();
    
    for(PVector p:points) {
      PVector globalP = PVector.add(this,p);
      globalShape.add(globalP);
    }
    return globalShape;
  }
}

