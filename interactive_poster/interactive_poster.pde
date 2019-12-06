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

//varibales for the circular buffer
int indexNum = 2;
float [] mousePos = new float [indexNum];
int indexPos = 0;

//Theese three arrays hold the variables for the four buttons on the start page
float [] buttonX = {100, 500, 100, 500};
float [] buttonY = {100, 100, 500, 500};
float [] buttonR = {100, 100, 100, 100};

//Checks if the buttons is pressed
boolean [] isPressed = {false, false, false, false};

//Keeps track on wich page is loaded. 
boolean [] pages = {false, false, false, false};
boolean startpage = false;

boolean isMousePressed;
boolean active;
boolean isMouseClicked;

float buttonR1 = 50; 
color buttonColor = color(255, 0, 0);
color newColorButton = color(255, 0, 255);
int num = 4;
Button [] myButtons = new Button [num];

//initializes the button that takes us back to the startpage.
Button backButton;
Quiz NextButton;

Boolean backShow = true;

int numberOfPages = 4;
Page [] page = new Page [numberOfPages];

//Quiz
Quiz [] quiz = new Quiz [10];
int ellipseSize = 25;
float ellipseX = 62.5;
int ellipseYStart = 375;
Boolean [] whatQuiz = {false, false, false, false, false, false, false, false, false, false};
int [] correctAnswers = {1, 2, 0, 2, 0, 1, 1, 2, 0, 1};
int quizIndex;


//Next button variables
float rectX = 800;
float rectY = 500;
float rectSize = 50;



void setup() {
  //size(1080, 1920);
  size(1080, 1920);
  backButton = new Button(width/2, height/2, buttonR1, buttonR1);

  test = loadImage("scrolltest.png");

  for (int i = 0; i < numberOfPages; i++) {
    page[i] = new Page(0, 0, test);
  }

  for (int i = 0; i < quiz.length; i++) {
    quiz [i] = new Quiz(ellipseX, ellipseYStart, ellipseSize, rectX, rectY, rectSize);
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

      if ( i == 3) {
        for (int j = 0; j < quiz.length; j++) {
          if (whatQuiz[j]) {
            quiz[j].Body();
            quiz[j].Interact();
            quiz[j].correct(correctAnswers[j]);
            
          }
        }
      }
    }
  }




  /*
  //Controls what pages are displayed
   if (startpage) { 
   startPage();
   } else if (pages[0]) { 
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
   */
   
  //Controls the Bolleans for which page should be shown
  for (int i = 0; i < isPressed.length; i++) {
    if (isPressed[i]) {
      pages[i] = true; 
      startpage = false;
    }
  }

  //This creates a button that sets the booleans to deload all pages and load the startpage
  if (!show) {
    backButton.display(buttonColor);

    if ( mousePressed && dist(mouseX, mouseY, backButton.x, backButton.y) < backButton.r/2) {
      for (int i = 0; i < num; i++) {
        pages[i] = false;
      }
      startpage = true;
    }


    if (!mousePressed) {
      // if the mouse is not pressed, they mousePos array is filled with the current positon
      for (int i = 0; i < mousePos.length; i++) {
        mousePos[i] = mouseY;
      }
    }

    //resets isMouseClicked
    isMouseClicked = false;
  }
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
