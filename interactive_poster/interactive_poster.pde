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


//Theese three arrays hold the variables for the four buttons on the start page
float [] buttonX = {100, 500, 100, 500};
float [] buttonY = {100, 100, 500, 500};
float [] buttonR = {100, 100, 100, 100};

//Checks if the buttons is pressed
boolean [] isPressed = {false, false, false, false};

//Keeps track on wich page is loaded. 
boolean [] pages = {false, false, false, false};
boolean startpage = true;

boolean isMousePressed;
boolean active;

float buttonR1 = 50; 
color buttonColor = color(255, 0, 0);
color newColorButton = color(255, 0, 255);
int num = 4;
Button [] myButtons = new Button [num];

//initializes the button that takes us back to the startpage.
Button backButton;

int numberOfPages = 4;
Page [] page = new Page [numberOfPages];



void setup() {
  //size(1080, 1920);
  size(1080, 1920);
  backButton = new Button(width/2, height/2, buttonR1, buttonR1);

  test = loadImage("scrolltest.png");

  for (int i = 0; i < numberOfPages; i++) {
    page[i] = new Page(0, 0, test);
  }
}
void draw() {

  background(255);


//Controls what pages are displayed
  if (startpage) startPage();
  else if (pages[0]) { 
    page[0].showPage();
    page[0].slider();
  } else if (pages[1]) { 
    page[1].showPage(); 
    page[1].slider();
  } else if (pages[2]) { 
    page[2].showPage(); 
    page[2].slider();
  } else if (pages[3] ) { 
    page[3].showPage(); 
    page[3].slider();
  }

  //This creates a button that sets the booleans to deload all pages and load the startpage
  backButton.display(buttonColor);
  if ( mousePressed && dist(mouseX, mouseY, backButton.x, backButton.y) < backButton.r/2) {
    for (int i = 0; i < num; i++) {
      pages[i] = false;
    }
    startpage = true;
  }
}

void mouseReleased () {
isMousePressed = false;
}


void mousePressed () {
isMousePressed = true;
}
