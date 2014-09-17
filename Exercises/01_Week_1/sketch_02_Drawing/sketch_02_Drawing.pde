// using processing in 'straight' mode. don't need setup/draw in this exercise.

size(640,640);
// Q2.1 white background
background(255);

// Q2.2 draw a circle in the middle of the screen
float diameter = 50.0f; // define the diameter of the circle
float centerX = width / 2; // get the Horizontal center of the screen
float centerY = height / 2; // get the Vertical center of the screen 

noStroke();
fill(255,0,0);
ellipse(centerX,centerY,diameter,diameter);

// Q2.3 draw a rectangle

// I'll put it in the first third on the same height as the circle
rectMode(CENTER);
// reusing the diameter of the ellipse
// exercise states it has to be a rectangle so y = diameter * 2;
rect(width/3,centerY,diameter,diameter*2);

// Q2.4 draw a house

// now let's get into a bit more advanced usage of the drawing API.

// screen position
float secondThirdX = 2*width/3;

float baseWidth = 50.0f; // width of the base of the house
float baseHeight = 25.0f; // width of the height of the house

float roofHeight = 25.0f;
float roofExtend = 5.0f; // stores how far the roof should extend over the edges of the rest of the house

// I've grown to dislike using multiple variables for coordinates, so I'll use PVector from now on.

PVector p1 = new PVector(0-roofExtend,0);
PVector p2 = new PVector(baseWidth+roofExtend,0);
PVector p3 = new PVector(baseWidth/2,-roofHeight);

pushMatrix();
translate(secondThirdX,centerY);
rect(0,0,baseWidth,baseHeight);
pushMatrix();
translate(-baseWidth/2,-baseHeight/2);
triangle(p1.x,p1.y,p2.x,p2.y,p3.x,p3.y);
popMatrix();
popMatrix();

// Q2.5 Draw a Banana with the arc function

float firstThirdY = width/3;

fill(255,255,0); // banana's are yellow, right?
pushMatrix();
translate(centerX,firstThirdY);
arc(0,0,50,25,-PI/8,PI+PI/8);

// let's add a stem so people read the shape as a banana.
pushMatrix();
translate(25,-3);
rotate(-PI/8);
fill(#5D2A0D);
rect(0,0,10,5);
popMatrix();
popMatrix();


// Q2.6 Draw a Smiley Face

float secondThirdY = 2*width/3;

float pupilDiameter = 10.0f;
float socketDiameter = 20.0f;
float faceDiameter = 80.0f;

pushMatrix();
translate(centerX,secondThirdY);

// draw the face
fill(255,255,0); // yellow face!)
ellipseMode(CENTER);
ellipse(0,0,faceDiameter,faceDiameter);

// draw the sockets
fill(255); // white sockets);
ellipse(-15,-10,socketDiameter,socketDiameter);
ellipse(15,-10,socketDiameter,socketDiameter);

// draw the pupils
fill(0);
ellipse(-15,-8,pupilDiameter,pupilDiameter);
ellipse(15,-8,pupilDiameter,pupilDiameter);

// for the sake of it, let's give the smiley a mouth
noFill();
stroke(0);
arc(0,2,50,50,0,PI);
popMatrix();
