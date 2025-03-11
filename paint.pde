color currentColor = color(0); // Default color is black
int brushSize = 10;
int buttonSize = 50;
color[] colors = {color(0), color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(255, 255, 0)};
String[] colorNames = {"Black", "Red", "Green", "Blue", "Yellow"};
float sliderX;
float sliderMinX = 500;
float sliderMaxX = 750;
boolean draggingSlider = false;

void setup() {
  size(800, 600);
  background(255);
  sliderX = sliderMinX; // Set initial slider position
  drawColorButtons();
  
}

void draw() {
  drawSlider();
  if (mousePressed && mouseY > buttonSize + 10 && !draggingSlider) {
    stroke(currentColor);
    strokeWeight(brushSize);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  

  fill(255);
  noStroke();
  rect(480, 15, 300, 30); // Clear previous slider area
  drawSlider();
}

void drawColorButtons() {
  for (int i = 0; i < colors.length; i++) {
    fill(colors[i]);
    stroke(0);
    rect(i * buttonSize, 0, buttonSize, buttonSize);
  }
}

void drawSlider() {
  // Draw the slider line
  stroke(0);
  strokeWeight(5);
  line(sliderMinX, 30, sliderMaxX, 30);
  
  // Draw the slider handle
  fill(0);
  ellipse(sliderX, 30, 20, 20);
}

void mousePressed() {
  if (mouseY < buttonSize) {
    int index = mouseX / buttonSize;
    if (index >= 0 && index < colors.length) {
      currentColor = colors[index];
    }
  }

  // Check if mouse is near the slider
  if (dist(mouseX, mouseY, sliderX, 30) < 10) {
    draggingSlider = true;
  }
}

void mouseDragged() {
  if (draggingSlider) {
    sliderX = constrain(mouseX, sliderMinX, sliderMaxX);
    brushSize = int(map(sliderX, sliderMinX, sliderMaxX, 1, 50)); // Map slider position to brush size
  }
}

void mouseReleased() {
  draggingSlider = false;
}
