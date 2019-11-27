float buttonX = 60;
float buttonY = 100;
float buttonR = 100;
float buttonR1 = 50;
color buttonColor = color(100, 200, 50);

void setup() {
  size(640, 640);
}

void draw() {
  Button myButton = Button(buttonX, buttonY, buttonR, buttonR1, buttonColor);
  myButton.display();
}
