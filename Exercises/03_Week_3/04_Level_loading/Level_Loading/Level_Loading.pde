int tileSize = 16;
String level[];

PImage wallTile;

void setup() {
  size(640, 640);
  level = loadStrings("level.txt"); // seems to me like loadStrings returns an array of Strings?
  wallTile = loadImage("wall.png");
}

void draw() {
  background(255);

  for (int i = 0; i < level.length; i++) {
    for (int j = 0; j<level[i].length (); j++) {
      // I can't remember coming across 'switch' in the presentations, but it works great in this setup!
      pushMatrix();
      translate(j*tileSize, i*tileSize);
      switch(level[i].charAt(j)) {
      case ' ':
        drawEmpty();
        break;
      case '#':
        drawWall();
        break;
      case '$':
        drawCrate();
        break;
      case '@':
        drawPlayer();
        break;
      case '.':
        drawCrateDestination();
        break;
      }
      popMatrix();
    }
  }
}


void drawEmpty() {
  noStroke();
  fill(255);
  rectMode(CORNER);
  rect(0, 0, tileSize, tileSize);
}

void drawWall() {
  /*
  noStroke();
  fill(192);
  rectMode(CORNER);
  rect(0, 0, tileSize, tileSize);
  */
  image(wallTile,0,0);
}

void drawCrate() {
  noStroke();
  fill(#603913);
  rectMode(CORNER);
  rect(0, 0, tileSize, tileSize);
}

void drawPlayer() {
  noStroke();
  fill(255, 255, 0);
  ellipseMode(CORNER);
  ellipse(0, 0, tileSize, tileSize);
}

void drawCrateDestination() {
  noStroke();
  fill(#0054a6);
  rectMode(CORNER);
  rect(0, 0, tileSize, tileSize);
}
