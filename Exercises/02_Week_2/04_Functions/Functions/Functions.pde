PVector p1;
PVector p2;


void setup() {
  p1 = new PVector(0,0);
  p2 = new PVector(100,100);
  
  println(multiplyTwo(4.0f));
  println(multiply(4.0f,8.0f));
  
  println(distanceLazy(p1,p2));
  println(distance(p1,p2));
}

void draw() {

}


float multiplyTwo(float input) {
  return input*2;
}

float multiply(float a, float b) {
 return a*b; 
}

// lazy version
float distanceLazy(PVector p1, PVector p2) {
    return PVector.dist(p1,p2);
}

// proof that I actually remember highschool
float distance(PVector p1,PVector p2) {
  return sqrt((p1.x-p2.x)*(p1.x-p2.x)+(p1.y-p2.y)*(p1.y-p2.y));
  
}
