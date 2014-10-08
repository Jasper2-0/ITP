int depth = 5;

void setup() {
  size(640, 640);
  background(255);
  noFill();
  stroke(#204080);

  sierpinskiTriangle(new PVector(0, height), new PVector(width, height), new PVector(width/2, 0));
}


void sierpinskiTriangle(PVector p1, PVector p2, PVector p3) {
  triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
  subTriangle(1, PVector.div(PVector.add(p1, p2), 2), PVector.div(PVector.add(p2, p3), 2), PVector.div(PVector.add(p3, p1), 2));
}

void subTriangle(int level, PVector p1, PVector p2, PVector p3) {

  triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);

  if (level < depth) {

    PVector np1 = PVector.add(PVector.div(PVector.add(p1, p2), 2), PVector.div(PVector.sub(p2, p3), 2));
    PVector np2 = PVector.add(PVector.div(PVector.add(p1, p2), 2), PVector.div(PVector.sub(p1, p3), 2));
    PVector np3 = PVector.div(PVector.add(p1, p2), 2);

    subTriangle(level+1, np1, np2, np3);

    np1 = PVector.add(PVector.div(PVector.add(p3, p2), 2), PVector.div(PVector.sub(p2, p1), 2));
    np2 = PVector.add(PVector.div(PVector.add(p3, p2), 2), PVector.div(PVector.sub(p3, p1), 2));
    np3 = PVector.div(PVector.add(p3, p2), 2);

    subTriangle(level+1, np1, np2, np3);

    np1 = PVector.add(PVector.div(PVector.add(p1, p3), 2), PVector.div(PVector.sub(p3, p2), 2));
    np2 = PVector.add(PVector.div(PVector.add(p1, p3), 2), PVector.div(PVector.sub(p1, p2), 2));
    np3 = PVector.div(PVector.add(p1, p3), 2);

    subTriangle(level+1, np1, np2, np3);
  }
}

