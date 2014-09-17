PVector p;
PVector c;

float defaultSize = 5.0f;
float ellipseSize;
float maxSize = 75;

int steps;
float stepSize;
float inc;


void setup() {
  size(640,640);
  
  c = new PVector(width / 2, height / 2);  
  p = new PVector(0,c.y);

  ellipseSize = defaultSize;


  steps = width;
  
  stepSize = 1 / float(steps);

}


void draw() {

ellipseSize = lerp(defaultSize,maxSize,inc);

  
background(255);
noStroke();
fill(255,0,0);
ellipseMode(RADIUS);
ellipse(p.x,p.y,ellipseSize,ellipseSize);

p.x = p.x+1;
inc = inc + stepSize;

if(p.x > width) {
  p.x = 0;
  inc = 0;
}

}
