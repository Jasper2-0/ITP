int calls = 0;


void setup() {
  println(millis());
  println(fibonacci(15));
  println("calls: "+calls);
  println(millis());
}


int fibonacci(int n) {
  if(n<=1) {
    return n;
  } else {
    calls++;
    return fibonacci(n-1) + fibonacci(n-2);
  }
}
