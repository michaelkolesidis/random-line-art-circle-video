import processing.video.*;

Capture video;

float x, y;        // Line starting point
float newX, newY;  // Line ending point

void setup() {
  size(600, 600);
  background(255);
  
  video = new Capture(this, 600, 600);
  video.start();
  
  x = width/2;
  y = height/2;
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
;
  
  strokeWeight(4);

  float radius = random(200);
  float a = random(TWO_PI);

  float newX = width/2 + cos(a) * radius;
  float newY = height/2 + sin(a) * radius;

  int midX = int((x + newX) /2);
  int midY = int((y + newY) /2);
  
  color c = video.pixels[(width-1-midX) + midY * video.width];

  stroke(c);
  line(x, y, newX, newY);
  x = newX;
  y = newY;
}
