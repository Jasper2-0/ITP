// took ben's suggestion to use longs, that way there's no overflow.

void setup() {
  println(fibonacci(100));

}

long fibonacci(long n) {

  long prevValue = 1;
  long curValue = 1;

  if (n <= 1) {
    return n;
  }
  for (int i = 2; i<n; i++) {
    long temp = curValue;
    curValue += prevValue;
    prevValue = temp;
  }
  return curValue;
}


