/* 

I will glady admit I was terribly tempted to go OOP with these exercises,
In the spirit of the class, I think i only used what was taught in class...

*/

int numCirc = 20;

float ellipseSize = 20.0f;
float ellipseSpace = 10.0f;

float rowWidth;

color[] colors = new color[numCirc];

float centerX;
float centerY;

void setup() {
  size(640,640);
 
  centerX = width / 2;
  centerY = height / 2;
  
  for(int i = 0; i<colors.length;i++) {
    colors[i] = randomColor();
  }
  
  rowWidth = numCirc*ellipseSize+(numCirc-1)*ellipseSpace;
  
}


void draw() {
  background(192);
  for(int i = 0; i < colors.length;i++) {
    float xPos = centerX-(rowWidth/2) + i*ellipseSize + i * ellipseSpace; 
    float yPos = centerY;
    
    noStroke();
    fill(colors[i]);
    ellipse(xPos,yPos,ellipseSize,ellipseSize);
    
  }
}

color randomColor() {
  return color(random(1)*255,random(1)*255,random(1)*255);
}
