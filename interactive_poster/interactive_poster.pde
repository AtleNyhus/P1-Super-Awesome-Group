import processing.sound.*;
//sound clickButton;

//Theese three arrays hold the variables for the four buttons on the start page
float [] buttonX = {100, 500, 100, 500};
float [] buttonY = {100, 100, 500, 500};
float [] buttonR = {100, 100, 100, 100};

//Checks if the buttons is pressed
boolean [] isPressed = {false, false, false, false};

//Keeps track on wich page is loaded. 
boolean [] pages = {false, false, false, false};
boolean startpage = true;

float buttonR1 = 50; 
color buttonColor = color(255, 0, 0);
color newColorButton = color(255, 0, 255);
int num = 4;
Button [] myButtons = new Button [num];

//initializes the button that takes us back to the startpage.
Button backButton;



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
  mousePos[indexPos] = mouseY;
  indexPos = (indexPos + 1) % indexNum;

  if (startpage == true) startPage();
  else if (pages[0]) page1();
  else if (pages[1]) page2();
  else if (pages[2]) page3();
  else if (pages[3]) page4();

  backButton.display(buttonColor);
  if ( mousePressed && dist(mouseX, mouseY, backButton.x, backButton.y) < backButton.r/2) {
    for (int i = 0; i < num; i++) {
      pages[i] = false;
    }
    startpage = true;
  }

  println(mousePos);
}
