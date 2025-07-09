int order = 1;
int N = int(pow(2, order)); // subdivisions along the width/height of the canvas
int numberOfPoints = N * N;
PVector[] path = new PVector[numberOfPoints];

PVector hilbert(int i) {
  PVector[] points = {
    new PVector(0, 0),
    new PVector(0, 1),
    new PVector(1, 1),
    new PVector(1, 0)
  };
  return points[i];
}

void setup() {
  size(1024, 1024);
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
  for (int i = 0; i < path.length; i++) {
    vertex(path[i].x, path[i].y);
  }
  endShape();
}
