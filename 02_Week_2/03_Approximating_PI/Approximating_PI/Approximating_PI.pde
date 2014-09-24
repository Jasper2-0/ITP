PVector c;
float rad;

float pointTotal = 0;
float pointInCircle = 0;

void setup() {
  size(640,640);
  
  frameRate(60);
  background(0);
  
  c = new PVector(0,0);
  rad = width;
    
  float areaQuartCircle = 0.25f*PI*pow(width,2);
  float areaScreen = width*height;
  
  println("Area of the Quarter Circle = "+areaQuartCircle);
  println("Area of the screen = "+areaScreen);
  println("Probability of a random point being inside the circle: "+100*areaQuartCircle/areaScreen+"%");
  
}

void draw() {
  
  PVector p = new PVector(round(random(1)*width),round(random(1)*height));
  
  float squareDist = pow((c.x-p.x),2) + pow((c.y-p.y),2);

  noFill();
  
  if(squareDist <=pow(rad,2)) {
    stroke(255,0,0);
    pointInCircle = pointInCircle + 1;
  } else {
    stroke(255);
  }
  
  point(p.x,p.y);
  pointTotal = pointTotal + 1;
 
  println("Estimate: "+4*pointInCircle/pointTotal);
 
  
}
