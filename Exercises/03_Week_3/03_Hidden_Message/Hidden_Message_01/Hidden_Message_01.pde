PImage a;
PImage b;

char[] diff;
int charOffset = 63;

int diffIndex = 0;

a = loadImage("a.png");
b = loadImage("b.png");

// lets see how many times there are differences in the pixels arrays
for (int i = 0; i<a.pixels.length; i++) {
  if (a.pixels[i] != b.pixels[i]) {
    diffIndex = diffIndex +1;
  }
}

diff = new char[diffIndex]; 
diffIndex = 0;

// now lets get those diffs out into the open
for (int i = 0; i<a.pixels.length; i++) {
  if (a.pixels[i] != b.pixels[i]) {
    diff[diffIndex] = char(charOffset + b.pixels[i] - a.pixels[i]); // why would we need a decoding array if we have char?
    diffIndex = diffIndex +1;
  }
}
String message = new String(diff);
println(message.replace('@', ' '));

/*
a proppos, Anna Chapman says hi!
 http://www.wired.com/2010/06/alleged-spies-hid-secret-messages-on-public-websites/
 */
