color currentColor = color(0); // Default color is black
int brushSize = 10;
int buttonSize = 50;
color[] colors = {color(0), color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(255, 255, 0)};
String[] colorNames = {"Black", "Red", "Green", "Blue", "Yellow"};
float sliderX;

void setup() {
  size(800, 600);
  background(255);
  fill(190);
  rect(0, 0, 800, buttonSize + 10);
  
  
  
  
  sliderX = 500;
  drawColorButtons();
  drawSlider();
}

void draw() {
  // Draw only if mouse is below the button area
  if (mousePressed && mouseY > buttonSize + 10) {
    stroke(currentColor);
    fill(currentColor);
    ellipse(mouseX, mouseY, brushSize, brushSize);
  }
}


void drawColorButtons() {
  for (int i = 0; i < colors.length; i++) {
    fill(colors[i]);
    stroke(0);
    rect(i * buttonSize, 0, buttonSize, buttonSize);
  }
}

void drawSlider() {
  strokeWeight(15);
  line(500, 30, 750, 30);
  strokeWeight(1);
  circle(sliderX, 30, 20);
  
  
  
  
}


void mousePressed() {
  if (mouseY < buttonSize) {
    int index = mouseX / buttonSize;
    if (index >= 0 && index < colors.length) {
      currentColor = colors[index];
    }
  }
}

void mouseDragged() {
  
  
  
  
}
