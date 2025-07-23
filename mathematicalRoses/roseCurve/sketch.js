let d, n;
let sliderN, sliderD;
let labelN, labelD;
let container;

function setup() {
  // set the background of the page
  document.body.style.backgroundColor = "#6A7BA2";

  // create a wrapper div to center everything
  container = createDiv();
  container.style('display', 'flex');
  container.style('flex-direction', 'column');
  container.style('align-items', 'center');
  container.style('justify-content', 'center');
  container.style('min-height', '100vh');

  // create canvas inside the container
  const canvas = createCanvas(500, 500);
  canvas.parent(container);

  // create and attach labels and sliders to the container
  labelN = createP();
  labelN.parent(container);
  sliderN = createSlider(1, 10, 1);
  sliderN.parent(container);

  labelD = createP();
  labelD.parent(container);
  sliderD = createSlider(1, 10, 1);
  sliderD.parent(container);
}

function draw() {
  n = sliderN.value();
  d = sliderD.value();
  const k = n / d;

  labelN.html(`n = ${n}`);
  labelD.html(`d = ${d}`);

  background(0);
  // the point of origin in p5 in top left so we translate to the center
  translate(width / 2, height / 2);

  beginShape();
  stroke(255);
  noFill();
  strokeWeight(2);
  // the times you go around the circle depend on the denominator
  for (let theta = 0; theta < TWO_PI * d; theta += 0.02) {
    // polar to cartesian coords
    const radius = 200 * cos(k * theta); // scale by 200 to appear bigger in the canvas
    const x = radius * cos(theta);
    const y = radius * sin(theta);
    vertex(x, y);
  }
  endShape();
}
