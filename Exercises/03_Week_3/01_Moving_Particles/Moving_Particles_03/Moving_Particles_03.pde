/* 

I will glady admit I was terribly tempted to go OOP with these exercises,
In the spirit of the class, I think I only used what was taught in class...

*/

int numCirc = 20;

float ellipseSize = 20.0f;
float ellipseSpace = 10.0f;

float rowWidth;

color[] colors = new color[numCirc];

float[] xPos = new float[numCirc];
float[] yPos = new float[numCirc];

float[] xVel = new float[numCirc];
float[] yVel = new float[numCirc];

float[] xAcc = new float[numCirc];
float[] yAcc = new float[numCirc];

float centerX;
float centerY;

float topSpeed = 5.0f;

float topBound;
float bottomBound;
float leftBound;
float rightBound;

void setup() {
  size(640,640);
 
  centerX = width / 2;
  centerY = height / 2;

  rowWidth = numCirc*ellipseSize+(numCirc-1)*ellipseSpace;
  
  for(int i = 0; i<colors.length;i++) {
    colors[i] = randomColor();
    xPos[i] = centerX-(rowWidth/2) + i*ellipseSize + i * ellipseSpace; 
    yPos[i] = centerY;
    
    xAcc[i] = 1-random(2);
    yAcc[i] = 1-random(2);
  }
  
  topBound = 0 + ellipseSize / 2;
  bottomBound = height - ellipseSize / 2;
  
  leftBound = 0 + ellipseSize / 2;
  rightBound = width - ellipseSize / 2;
  
}

void update() {
  
  for(int i=0;i<colors.length;i++) {

    xVel[i] = xVel[i] + xAcc[i];
    yVel[i] = yVel[i] + yAcc[i];
    
// bounding the velocity    
    if(xVel[i] > topSpeed) {
      xVel[i] = topSpeed;
    }
    if(xVel[i] < -topSpeed) {
      xVel[i] = -topSpeed;
    }
    if(yVel[i] > topSpeed) {
      yVel[i] = topSpeed;
    }
    if(yVel[i] < -topSpeed) {
      yVel[i] = -topSpeed;
    }

// bound the moving particles. for kicks we'll flip their velocity acceleration 

   if(xPos[i] < leftBound) {
     xAcc[i] = -xAcc[i];
     xVel[i] = -xVel[i];
   }

   if(xPos[i] > rightBound) {
     xAcc[i] = -xAcc[i];
     xVel[i] = -xVel[i];
   }

  if(yPos[i] < topBound) {
    yAcc[i] = -yAcc[i];
    yVel[i] = -yVel[i];
  }

  if(yPos[i] > bottomBound) {
    yAcc[i] = -yAcc[i];
    yVel[i] = -yVel[i];
  }  
   
    xPos[i] = xPos[i] + xVel[i];
    yPos[i] = yPos[i] + yVel[i];
    
  }
  
}

// repeat after me: DRAW IS FOR DRAWING. 
// of course, this only applies when the time from your deadline is > 2 hours.

void draw() {
  
  update();
  
  background(192);
  for(int i = 0; i < colors.length;i++) {  
    noStroke();
    fill(colors[i]);
    ellipse(xPos[i],yPos[i],ellipseSize,ellipseSize);
  }
}

color randomColor() {
  return color(random(1)*255,random(1)*255,random(1)*255);
}
