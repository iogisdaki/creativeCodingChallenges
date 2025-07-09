int order = 2;
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
  // the small square's orientation at the lowest level.
  int index = i & 3;  
  PVector v = points[index];

  // extract the previous two bits
  // this represents the quadrant of the canvas the point is in
  i = i >>>  2; 
  index = i & 3;

  // translate and rotate according to the quadrant
  // the order the line is drawn is always points 0,1,2,3
  if (index == 0){
    // upper left quardrant
    // 90-degree rotation along the diagonal line x = y 
    float temp = v.x;
    v.x = v.y;
    v.y = temp;
  } else if (index == 1){
    // bottom left quardrant
    v.y += order;
  } else if (index == 2){
    // bottom right quardrant
    v.x += order;
    v.y += order;
  } else if (index == 3){
    // upper right quardrant
    v.x += order;
  }
  return v;
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
