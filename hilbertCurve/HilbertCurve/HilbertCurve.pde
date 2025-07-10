int order = 6;
int N = int(pow(2, order)); // subdivisions along the width/height of the canvas
int numberOfPoints = N * N;
PVector[] path = new PVector[numberOfPoints];

PVector hilbert(int i) {
  // first order (base) points
  // make the basic "U" shape in a 2×2 grid.
  PVector[] points = {
    new PVector(0, 0),
    new PVector(0, 1),
    new PVector(1, 1),
    new PVector(1, 0)
  };

  // extract the lowest 2 bits
  // the smallest square's orientation at the lowest level
  int index = i & 3;
  PVector v = points[index];

  for (int level = 1; level < order; level++) {
    // extract the previous two bits
    // determines which quadrant of the next larger scale we're in according to the level
    i = i >>>  2;
    index = i & 3;
    // length of side of the quadrant at the current recursion level
    // used in rotation and translation
    float len = pow(2, level);
    // translate and rotate according to the quadrant
    // the order the line is drawn is always points 0,1,2,3
    if (index == 0) {
      // upper left quardrant
      // 90-degree rotation along the diagonal line x = y
      float temp = v.x;
      v.x = v.y;
      v.y = temp;
    } else if (index == 1) {
      // bottom left quardrant
      // translate down(upper left corner is 0,0)
      v.y += len;
    } else if (index == 2) {
      // bottom right quardrant
      // translate right  and down
      v.x += len;
      v.y += len;
    } else if (index == 3) {
      // upper right quardrant
      float temp = len - 1 - v.x;
      v.x = len - 1 - v.y;
      v.y = temp;
      // translate right
      v.x += len;
    }
  }
  return v;
}

void setup() {
  size(1024, 1024);
  colorMode(HSB, 360, 255, 255);
  background(0);

  for (int i = 0; i < numberOfPoints; i++) {
    path[i] = hilbert(i);
    float len = width / N;
    path[i].mult(len); // each point is scaled to fit the canvas
    path[i].add(len/2, len/2); // each point is centered
  }
}

int counter = 0;
void draw() {
  background(0); // clear canvas
  stroke(255);
  strokeWeight(2);
  noFill();
  beginShape();
  for (int i = 1; i < counter; i++) { // draw it gradually as draw is recalled
    float colour = map(i, 0, path.length, 0, 360);
    stroke(colour, 255, 255);
    line (path[i].x, path[i].y, path[i-1].x, path[i-1].y);
  }
  endShape();
  counter = (counter < path.length) ? counter+1 : counter;
}
