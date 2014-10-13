class Arena extends Sprite {
  float width;
  float height;

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

    this.points = new ArrayList<PVector>();
    this.pos = new PVector();

    for (int i = 0; i<cols; i++) {
      for (int j = 0; j<rows+1; j++) {
        points.add(new PVector(j*wUnit, i*hUnit));
        points.add(new PVector(j*wUnit, (i+1)*hUnit));
      }
    }
  }


  void draw() {
    pushMatrix();
    pushStyle();
    translate(pos.x, pos.y,pos.z);
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
    popStyle();
    popMatrix();
  }
}
