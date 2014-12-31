class Arena extends GameObject {
  float wUnit;
  float hUnit;

  float rows;
  float cols;

  ArrayList<PVector> points;

  Arena (float width, float height, int rows, int cols) {
    this.width = width;
    this.height = height;
    this.rows = parseFloat(rows);
    this.cols = parseFloat(cols);
    this.wUnit = width / rows;
    this.hUnit = height / cols;

    this.bounds = new Rect();

    this.points = new ArrayList<PVector>();

    for (int i = 0; i<cols; i++) {
      for (int j = 0; j<rows+1; j++) {
        points.add(new PVector(j*wUnit, i*hUnit));
        points.add(new PVector(j*wUnit, (i+1)*hUnit));
      }
    }

    updateBounds();
  }

  void updateBounds() {
    for (PVector p : points) {
      bounds.growToContainPoint(p);
    }
  }

  void draw() {
    pushMatrix();
    pushStyle();
    translate(x, y);
    noFill();
    strokeWeight(1);
    stroke(#102040);

    Iterator<PVector> currentPoint = points.iterator();

    for (int i = 0; i<cols; i++) {
      beginShape(QUAD_STRIP);
      for (int j = 0; j<rows+1; j++) {
        PVector p = currentPoint.next();
        vertex(p.x, p.y);
        p = currentPoint.next();
        vertex(p.x, p.y);
      }
      endShape();
    }
    strokeWeight(2);
    rect(0, 0, this.width, this.height);
    // outerline
    stroke(#204080);
    rect(0-10,0-10,this.width+20,this.height+20); 
    popStyle();
    if(debug) {
     drawDebug();
    }
    popMatrix();
  }
}

