int tileSize = 16;
String level[];

PImage wallTile;

int playerX;
int playerY;

void setup() {
  size(640, 640);
  level = loadStrings("level.txt"); // seems to me like loadStrings returns an array of Strings?
  wallTile = loadImage("wall.png");
  
  playerX = 11;
  playerY = 8;
  
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
  
  // draw player() 
  pushMatrix();
  translate(playerX*tileSize,playerY*tileSize);
  noStroke();
  fill(255, 0, 255);
  ellipseMode(CORNER);
  ellipse(0, 0, tileSize, tileSize);
  popMatrix();
}


void keyPressed() {
  if (key == CODED) { 

    if (keyCode == UP) {
//      println("up pressed");
      playerY--;
    }
    if (keyCode == DOWN) {
//      println("down pressed");
      playerY++;
    }
    if (keyCode == LEFT) {
//      println("left pressed");
      playerX--;
    }
    if (keyCode == RIGHT) {
//      println("right pressed");
      playerX++;
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
  image(wallTile, 0, 0);
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

