int[] arr = new int[6];

arr[0] = 4;
arr[1] = 2;
arr[2] = 7;
arr[3] = 1;
arr[4] = 3;
arr[5] = 8;

int l = arr[arr.length-1];

arr[arr.length-1] = arr[0];
arr[0] = l;

print(arr);
