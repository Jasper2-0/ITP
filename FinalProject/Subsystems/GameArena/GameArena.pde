import java.util.Iterator;

Arena a;

void setup() {
  size(1280, 720, P3D);
  
  a = new Arena(512,512,8,8);
  a.pos.x = -256+width/2;
  a.pos.y = -256+height/2;
  blendMode(ADD);
}

void draw() {
  background(0);
  
  a.draw();

}

