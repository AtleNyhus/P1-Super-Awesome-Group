

import at.mukprojects.imageloader.*;
import at.mukprojects.imageloader.file.*;
import at.mukprojects.imageloader.flickr.*;
import at.mukprojects.imageloader.gif.*;
import at.mukprojects.imageloader.giphy.*;
import at.mukprojects.imageloader.google.*;
import at.mukprojects.imageloader.image.*;
import at.mukprojects.imageloader.instagram.*;
import at.mukprojects.imageloader.tumblr.*;

import processing.sound.*;

PImage test;

int numOfPics = 4;
//The different pictures used in "pages"
PImage [] pictures = new PImage [numOfPics];

//varibales for the circular buffer
int indexNum = 2;
float [] mousePos = new float [indexNum];
int indexPos = 0;

//Theese three arrays hold the variables for the four buttons on the start page
float [] buttonX =  {58, 565, 60, 570};
float [] buttonY =  {770, 770, 1850, 1850};
float [] buttonR1 = {450, 465, 442, 465};
float [] buttonR2 = {820, 820, 820, 820};

float buttonR = 50;
//Checks if the buttons is pressed
boolean [] isPressed = {false, false, false, false};

//Keeps track on wich page is loaded. 
boolean [] pages = {false, false, false, false};
boolean startpage = false;

boolean isMousePressed;
boolean active;
boolean isMouseClicked;


color buttonColor = color(255, 0, 0, 0);
color newColorButton = color(255, 100);
color backButtonColor = color(255, 255, 0);
int num = 4;
Button [] myButtons = new Button [num];

//initializes the button that takes us back to the startpage.
Button backButton;
Boolean backShow = true;

int numberOfPages = 4;
Page [] page = new Page [numberOfPages];




void setup() {

  size(1080, 1920);
  backButton = new Button(100, 100, buttonR, buttonR);

  test = loadImage("scrolltest.png");
  pictures[0] = loadImage("Page0.png");

  for (int i = 0; i < numberOfPages; i++) {
    page[i] = new Page(0, 0, test);
  }
}
void draw() {

  background(255);

  if (show) { //Textbox gets shown on the background only and switches startpage to true when turned off. Dissapears after first use.
    boxShow();
  }

  //Controls what pages are displayed

  if (startpage) startPage();
  for (int i = 0; i < page.length; i++) {
    if (pages[i]) {
      page[i].showPage();
      page[i].slider();
    }
  }

  //Controls the Bolleans for wich page should be shown

  for (int i = 0; i < isPressed.length; i++) {
    if (isPressed[i]) {
      pages[i] = true; 
      startpage = false;
    }
  }


  
  // if the mouse is not pressed, they mousePos array is filled with the current positon
  if (!mousePressed) {
    for (int i = 0; i < mousePos.length; i++) {
      mousePos[i] = mouseY;
    }
  }
    //This creates a button that sets the booleans to deload all pages and load the startpage
  if(!show) backButton.home();
  
  //resets isMouseClicked
  isMouseClicked = false;

  
  
}
void mouseReleased () {
  isMousePressed = false;
}


void mousePressed () {
  isMousePressed = true;
}

void mouseClicked () {
  isMouseClicked = true;
}
