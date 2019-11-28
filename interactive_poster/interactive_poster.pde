import processing.sound.*;
//sound clickButton;

float edgeCommon = 30; //Styrer afrundingen af edgesne for alle boksne
float [] buttonX = {100, 500, 100, 500};
float [] buttonY = {100, 100, 500, 500};
float [] buttonR = {100, 100, 100, 100};
float [] buttonEdge = {edgeCommon, edgeCommon, edgeCommon, edgeCommon};

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

//varibales for the circular buffer
int indexNum = 10;
float [] mousePos = new float [indexNum];
int indexPos = 0;

void setup() {
  size(640, 640);
}

void draw() {
// small circular buffer that reads mouseX positions. This will be used when scrolling. 
  mousePos[indexPos] = mouseX;
  indexPos = (indexPos + 1) % indexNum;
  
  // Here, the four buttons are created, and if the mouse is pressed on one of the buttons, another buttons with a different
  // color is created instead. Also, a boolean monitors if a buttons is pressed or not. This might be usefull later.
  
  if (startpage == true) 
  {
    for (int i = 0; i <= myButtons.length-1; i++) 
    {
      myButtons[i] = new Button(buttonX[i], buttonY[i], buttonR[i], buttonR[i], buttonEdge[i]);
      if ( mousePressed && dist(mouseX, mouseY, myButtons[i].x, myButtons[i].y) < myButtons[i].r/2) 
      {
        myButtons[i].display(newColorButton);
        isPressed[i] = true;
      } else {
        myButtons[i].display(buttonColor);
        isPressed[i] = false;
      }
    }
    //Here I am prepering for when we want to display the other pages. 
  } else if (page1 == true) {
  } else if (page2 == true) {
  } else if (page3 == true) {
  } else if (page4 == true) {
  }
}
