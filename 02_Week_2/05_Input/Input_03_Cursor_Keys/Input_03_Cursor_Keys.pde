PVector pos;
float rectSize = 10;

void setup() {
  size(640,640);
  
  pos = new PVector(width/2,height/2);
  
  
}


void draw() {
    background(255);  
    noStroke();
    fill(255,0,0);
    rectMode(CENTER);
    rect(pos.x,pos.y,rectSize,rectSize);
}
/* 
I am aware doing it this way will allow for my square to only move in one direction
while i press multiple keys, but the assignment didn't require writing 8-directional movement...
*/

void keyPressed() {
  if(key == CODED) {
    if(keyCode == UP) {
      pos.y = pos.y - 1;
    }
    if(keyCode == DOWN) {
      pos.y = pos.y + 1;
    }
    if (keyCode == LEFT) {
      pos.x = pos.x - 1;
    }
    if (keyCode == RIGHT) {
      pos.x = pos.x + 1;
    }
  }
}
