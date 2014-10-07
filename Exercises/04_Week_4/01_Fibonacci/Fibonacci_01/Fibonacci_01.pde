void setup() {
  println(fibonacci(100));

}

float fibonacci(int n) {

  float prevValue = 1;
  float curValue = 1;

  if (n <= 1) {
    return n;
  }
  for (int i = 2; i<n; i++) {
    float temp = curValue;
    curValue += prevValue;
    prevValue = temp;
  }
  return curValue;
}


