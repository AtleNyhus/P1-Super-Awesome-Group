import processing.sound.*;
//sound clickButton;


float [] buttonX = {100, 500, 100, 500};
float [] buttonY = {100, 100, 500, 500};
float [] buttonR = {100, 100, 100, 100};

boolean [] isPressed = {false, false, false, false};
boolean [] pages = {false, false, false, false};
float buttonR1 = 50;
color buttonColor = color(255, 0, 0);
color newColorButton = color(255, 0, 255);
int num = 4;
Button [] myButtons = new Button [num];

Button backButton;


boolean startpage = true;

//varibales for the circular buffer
int indexNum = 10;
float [] mousePos = new float [indexNum];
int indexPos = 0;

void setup() {
  size(640, 640);
  backButton = new Button(width/2, height/2, buttonR1, buttonR1);
 // backButton.active = true;
}

void draw() {
  background(0);



  // small circular buffer that reads mouseX positions. This will be used when scrolling. 
  mousePos[indexPos] = mouseX;
  indexPos = (indexPos + 1) % indexNum;

  if (startpage == true) startPage();
  else if (pages[0]) page1();
  else if (pages[1]) page2();
  else if (pages[2]) page3();
  else if (pages[3]) page4();

  backButton.display(buttonColor);
  if ( mousePressed && dist(mouseX, mouseY, backButton.x, backButton.y) < backButton.r/2) {
    for (int i = 0; i < num-1; i++) {
      pages[i] = false;
    }
    startpage = true;
  }

  // Here, the four buttons are created, and if the mouse is pressed on one of the buttons, another buttons with a different
  // color is created instead. Also, a boolean monitors if a buttons is pressed or not. This might be usefull later.
  /*
  if (startpage == true) 
   {
   for (int i = 0; i <= myButtons.length-1; i++) 
   {
   myButtons[i] = new Button(buttonX[i], buttonY[i], buttonR[i], buttonR[i]);
   myButtons[i].active = true; //This sets all the "myButtons" to the true state (means they can be displayed)
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
   */

  println(pages);
}
