int iterations = 0;
int callsRec = 0;

void setup() {
  for (int i = 0; i < 20; i++) {
    println("i: "+i+" fib: "+fibonacciFor(i));
    println("iterations in the the for loop: "+iterations);
    println("------");
    println("i: "+i+" fib: "+fibonacciRec(i));
    println("Recursive calls to the function: "+callsRec);
    println("------");
  }
  
  println("in this particular algorithm, going about it recursively results in a massive amount of calls, compared to the iterations in the for-loop.");
}

long fibonacciFor(int n) {

  long prevValue = 1;
  long curValue = 1;

  if (n <= 1) {
    return n;
  }
  for (int i = 2; i<n; i++) {
    long temp = curValue;
    curValue += prevValue;
    prevValue = temp;
    iterations++;
  }
  return curValue;
}

long fibonacciRec(long n) {
  if (n<=1) {
    return n;
  } else {
    callsRec++;
    return fibonacciRec(n-1) + fibonacciRec(n-2);
  }
}
