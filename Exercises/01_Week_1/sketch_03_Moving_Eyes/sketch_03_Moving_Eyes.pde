// Q3 Moving Eyes exercise

float pupilDiameter = 10.0f;
float socketDiameter = 20.0f;
float faceDiameter = 80.0f;

PVector leftSocketPos;
PVector rightSocketPos;

PVector mouse;

void setup() {
  size(640,640);
  leftSocketPos = new PVector(305,310);
  rightSocketPos = new PVector(335,310);
  
}

void draw() {
   
mouse = new PVector(mouseX,mouseY);  

PVector dist1 = PVector.sub(mouse,leftSocketPos);
dist1.normalize();
dist1.mult(pupilDiameter/2);

PVector dist2 = PVector.sub(mouse,rightSocketPos);
dist2.normalize();
dist2.mult(pupilDiameter/2);

background(255);
// draw the face
fill(255,255,0); // yellow face!)
strokeWeight(3);
ellipse(320,320,faceDiameter,faceDiameter);
strokeWeight(1);
// draw the sockets
fill(255); // white sockets);
ellipse(305,310,socketDiameter,socketDiameter);
ellipse(335,310,socketDiameter,socketDiameter);

// for the sake of it, let's give the smiley a mouth
noFill();
stroke(0);
arc(320,322,50,50,0,PI);
fill(0);
ellipseMode(CENTER);
ellipse(leftSocketPos.x+dist1.x,leftSocketPos.y+dist1.y,pupilDiameter,pupilDiameter);
ellipse(rightSocketPos.x+dist2.x,rightSocketPos.y+dist2.y,pupilDiameter,pupilDiameter);

}
