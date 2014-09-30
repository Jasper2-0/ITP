int[] arr = new int[6];

arr[0] = 4;
arr[1] = 2;
arr[2] = 7;
arr[3] = 1;
arr[4] = 3;
arr[5] = 8;

boolean swap = true;

while (swap) {

   swap = false;
  
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
}

println(arr);

// so it works with integers, but can it sort chars?

char[] arrChar = new char[6];

arrChar[0] = 'j';
arrChar[1] = 'a';
arrChar[2] = 's';
arrChar[3] = 'p';
arrChar[4] = 'e';
arrChar[5] = 'r';

boolean swapChar = true;

while (swapChar) {

   swapChar = false;
  
  for (int i = 0; i<arrChar.length-1; i++) {
    char current = arrChar[i];
    char next = arrChar[i+1];

    if (next < current) {
      char l = arrChar[i];

      arrChar[i] = arrChar[i+1];
      arrChar[i+1] = l;
      swapChar=true;
    } 
  }
}

println(arrChar);

// victory!
