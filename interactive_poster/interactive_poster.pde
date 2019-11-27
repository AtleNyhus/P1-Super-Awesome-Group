import processing.sound.*;
sound clickButton;


float [] buttonX = {100, 500, 100, 500};
float [] buttonY = {100, 100, 500, 500};
float [] buttonR = {100, 100, 100, 100};

boolean [] isPressed = {false, false, false, false};
float buttonR1 = 50;
color buttonColor = color(255, 0, 0);
color newColorButton = color(255, 0, 255);
int num = 4;
Button [] myButtons = new Button [num];

boolean startpage = true;
boolean page1 = false;
boolean page2 = false;
boolean page3 = false;
boolean page4 = false;

void setup() {
  size(640, 640);
}

void draw() {

  if (startpage == true) 
  {
    for (int i = 0; i <= myButtons.length-1; i++) 
    {
      myButtons[i] = new Button(buttonX[i], buttonY[i], buttonR[i], buttonR[i]);
      if ( mousePressed && dist(mouseX, mouseY, myButtons[i].x, myButtons[i].y) < myButtons[i].r/2) 
      {
        myButtons[i].display(newColorButton);
        isPressed[i] = true;
      } else {
        myButtons[i].display(buttonColor);
        isPressed[i] = false;
      }
    }
  } else if (page1 == true) {
  } else if (page2 == true) {
  } else if (page3 == true) {
  } else if (page4 == true) {
  }
}
