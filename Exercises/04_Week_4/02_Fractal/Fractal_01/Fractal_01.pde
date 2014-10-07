void setup() {
  size(600, 600);
  background(255);
  noSmooth();
  sierpinskiCarpet(0, 0, width);
  
}


void sierpinskiCarpet(int x, int y, int size) {
  int sub = size / 3;
  noStroke();
  fill(0);
  rect(x+sub, y+sub, sub, sub);

  if (sub >= 4) {
    sierpinskiCarpet(x, y, sub);
    sierpinskiCarpet(x + sub, y, sub);
    sierpinskiCarpet(x + 2 * sub, y, sub);
    sierpinskiCarpet(x, y + sub, sub);
    sierpinskiCarpet(x + 2 * sub, y + sub, sub);
    sierpinskiCarpet(x, y + 2 * sub, sub);
    sierpinskiCarpet(x + sub, y + 2 * sub, sub);
    sierpinskiCarpet(x + 2 * sub, y + 2 * sub, sub);
  }
}

