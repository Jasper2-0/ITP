// using processing in 'straight' mode. don't need setup/draw in this exercise.

/* 
* Q1.1: Either int/float or double (the question doesn't specify how you're going to use the numbers.)
* For the exercise I assume we're fine using integers.
*/

/*
* Q1.2 print the values of a and b
*/

int a;
int b;

a = 4;
b = 5;

println("value of a: "+ a);
println("value of b: "+ b);
// or
println("value of a: "+ a +" and value of b: "+b);

/*
* Q1.3 Swap a and b without using the actual values
*/

int temp; // using this for intermediate storage

temp = a;
a = b;
b = temp;

println("we just swapped a and b");
println("value of a: "+ a +" and value of b: "+b);

