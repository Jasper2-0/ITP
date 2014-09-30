int[] arr = new int[6];

arr[0] = 4;
arr[1] = 2;
arr[2] = 7;
arr[3] = 1;
arr[4] = 3;
arr[5] = 8;

boolean swap = true;

println(arr);
println("--");

for (int i = 0; i<arr.length-1; i++) {
  int current = arr[i];
  int next = arr[i+1];

  if (next < current) {
    int l = arr[i];

    arr[i] = arr[i+1];
    arr[i+1] = l;
    swap=true;
  }
}

println(arr);

