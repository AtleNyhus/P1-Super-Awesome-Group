
import processing.sound.*;

PImage test;
PImage StartPage;

int numOfPics = 4;
//The different pictures used in "pages"
PImage [] pictures = new PImage [numOfPics];

//varibales for the circular buffer
int indexNum = 2;
float [] mousePos = new float [indexNum];
int indexPos = 0;

//Theese three arrays hold the variables for the four buttons on the start page
int numB=4;
float [] buttonX = new float [numB];
float [] buttonY = new float [numB];
float [] buttonR1 = new float [numB];
float [] buttonR2 = new float [numB];

float buttonR = 50;
//Checks if the buttons is pressed
boolean [] isPressed = {false, false, false, false};

//Keeps track on wich page is loaded. 
boolean [] pages = {false, false, false, false};
boolean startpage = true;

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
Quiz NextButton;

Boolean backShow = true;

int numberOfPages = 4;
Page [] page = new Page [numberOfPages];

//Quiz
Quiz [] quiz = new Quiz [10];
int ellipseSize = 25;
float ellipseX = 62.5;
int ellipseYStart = 375;
boolean [] whatQuiz = {false, false, false, false, false, false, false, false, false, false};
int [] correctAnswers = {2, 1, 0, 2, 0, 1, 1, 2, 0, 1};
int quizIndex;

float maxScroll [] = new float [numberOfPages];
boolean isSliding;
//Next button variables
float rectX = 800;
float rectY = 500;
float rectSize = 50;

int scaleFactor = 1;

void setup() {
  fullScreen();

  //fullScreen();
  backButton = new Button(100, 100, buttonR, buttonR);

  StartPage = loadImage("startpage.png");
  StartPage.resize(width, height);
  for (int i = 0; i < pages.length - 1; i++) {
    pictures[i] = loadImage("Page"+i+".png");
    maxScroll[i] = pictures[i].height/scaleFactor;
    pictures[i].resize(pictures[i].width/scaleFactor, pictures[i].height/scaleFactor);
  }
  pictures[1].resize(width, height);
  // pictures[1].resize(width, pictures[1].height);
  //pictures[2].resize(width, pictures[1].height);


  for (int i = 0; i < numberOfPages; i++) {
    page[i] = new Page(0, 0, pictures[i]);
  }
  test = loadImage("Page2.png");
  page[3] = new Page(0, 0, test);

  for (int i = 0; i < quiz.length; i++) {
    quiz [i] = new Quiz(ellipseX, ellipseYStart, ellipseSize, rectX, rectY, rectSize);
  }
  buttonX[0] = width * 0.054;
  buttonX[1] = width * 0.52;
  buttonX[2] = width * 0.054;
  buttonX[3] = width * 0.526;

  buttonY[0] = height * 0.4;
  buttonY[1] = height * 0.4;
  buttonY[2] = height * 0.693;
  buttonY[3] = height *0.693;

  buttonR1[0] = width * 0.413;
  buttonR1[1] = width * 0.433;
  buttonR1[2] = width * 0.413;
  buttonR1[3] = width * 0.433;

  buttonR2[0] = height * 0.193;
  buttonR2[1] = height * 0.197;
  buttonR2[2] = height * 0.193;
  buttonR2[3] = height * 0.197;
}

void draw() {

  background(255);
  // if the mouse is not pressed, they mousePos array is filled with the current positon
  if (!mousePressed) {
    for (int i = 0; i < mousePos.length; i++) {
      mousePos[i] = mouseY;
    }
  }

  if (show) { //Textbox gets shown on the background only and switches startpage to true when turned off. Dissapears after first use.
    boxShow();
  }


  //Controls what pages are displayed

  if (startpage) startPage();
  for (int i = 0; i < page.length; i++) {
    if (pages[i]) {
      page[i].showPage();
      page[i].slider(maxScroll[i]);

      if ( i == 3) {
        for (int j = 0; j < quiz.length; j++) {
          if (whatQuiz[j]) { //Not sure why this is working
            quiz[j].Body();
            quiz[j].Interact();
            quiz[j].correct(correctAnswers[j]);
          }
        }
      }
    }
  }



  //Controls the Bolleans for which page should be shown
  for (int i = 0; i < isPressed.length; i++) {
    if (isPressed[i]) {
      pages[i] = true; 
      startpage = false;
    }
  }




  if ( mousePressed && dist(mouseX, mouseY, backButton.x, backButton.y) < backButton.r/2) {
    for (int i = 0; i < num; i++) {
      pages[i] = false;
    }
    startpage = true;
  }


  if (mousePressed) {
    // if the mouse is not pressed, they mousePos array is filled with the current positon
    for (int i = 0; i < mousePos.length; i++) {
      mousePos[i] = mouseY;
      isSliding = true;
    }
  }





  //This creates a button that sets the booleans to deload all pages and load the startpage
  if (!show) backButton.home();

  //resets isMouseClicked
  isMouseClicked = false;
}

void mouseReleased () {
  isMouseClicked = true;
  isSliding = false;
}


void mousePressed () {
  isMouseClicked = false;
}

/*
void mouseClicked () {
 isMouseClicked = true;
 }
 */
