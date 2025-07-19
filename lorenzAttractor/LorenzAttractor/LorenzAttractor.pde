import peasy.*;

float x = 0.01;
float y = 0;
float z = 0;

float sigma = 10;
float rho = 28;
float beta = 8.0/3.0;

int maxSteps = 3500; // steps before stopping to draw
int stepCount = 0;

ArrayList<PVector> points = new ArrayList<PVector>();
PeasyCam cam;

float rotationAngle = 0;

void setup() {
  size(1150, 800, P3D); // working in 3D
  colorMode(HSB);
  cam = new PeasyCam(this, 500);
}

void draw() {
  // we consider every cycle through draw a single point of time
  background(0);
  if (stepCount < maxSteps) {
    float dt = 0.01;
    float dx = (sigma * (y - x)) * dt;
    float dy = (x * (rho - z) - y) * dt;
    float dz = (x * y - beta * z) * dt;
    x += dx;
    y += dy;
    z += dz;

    points.add(new PVector(x, y, z));
    stepCount++;
  }
  pushMatrix();
  rotateY(rotationAngle);
  rotationAngle += 0.005;

  translate(0, 0, -150);
  scale(5);
  noFill();

  float hue = 0;
  beginShape();
  for (PVector v : points) {
    stroke(hue, 255, 255);
    vertex(v.x, v.y, v.z);
    hue += 0.1;
    if (hue > 255) {
      hue = 0;
    }
  }
  endShape();
  popMatrix();
}
