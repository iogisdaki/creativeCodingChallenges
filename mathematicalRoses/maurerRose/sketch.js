let d, n;
let sliderN, sliderD;
let labelN, labelD;
let container;
let checkboxShowRose;

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
  sliderN = createSlider(1, 100, 1);
  sliderN.parent(container);

  labelD = createP();
  labelD.parent(container);
  sliderD = createSlider(1, 100, 1);
  sliderD.parent(container);

  // checkbox to toggle the rose curve visibility
  checkboxShowRose = createCheckbox('Show rose curve', false);
  checkboxShowRose.parent(container);

  angleMode(DEGREES);
}

function draw() {
  n = sliderN.value();
  d = sliderD.value();
  const k = n / d;

  labelN.html(`n = ${n}`);
  labelD.html(`d = ${d}`);

  background(0);
  translate(width / 2, height / 2);

  // the more complex curve
  stroke(255);
  noFill();
  strokeWeight(1);
  beginShape();
  for (let i = 0; i < 361; i++) {
    let k = i * d;
    let radius = 200 * sin(n * k);
    let x = radius * cos(k);
    let y = radius * sin(k);
    vertex(x, y);
  }
  endShape();

  // show rose curve only if checkbox is checked
  if (checkboxShowRose.checked()) {
    stroke("#C084FC");
    noFill();
    strokeWeight(2);
    beginShape();
    for (let i = 0; i < 361; i++) {
      let radius = 200 * sin(n * i);
      let x = radius * cos(i);
      let y = radius * sin(i);
      vertex(x, y);
    }
    endShape();
  }
}
