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

Page page1 = new Page(500,100);



void setup() {
  //size(1080, 1920);
  size(540, 970);
  backButton = new Button(width/2, height/2, buttonR1, buttonR1);
  // backButton.active = true;
  
}

void draw() {
  background(255);

page1.showPage();
page1.slider();
println(page1.y);
println(page1.yspeed);
/*
  if (startpage) startPage();
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
  */
}
