void startPage () {
  // creates the four buttons, and ads a hitbox to them.
  for (int i = 0; i <= myButtons.length-1; i++) 
  {
    myButtons[i] = new Button(buttonX[i], buttonY[i], buttonR[i], buttonR[i]);
    //myButtons[i].active = true; //This sets all the "myButtons" to the true state (means they can be displayed)
    if ( mousePressed && dist(mouseX, mouseY, myButtons[i].x, myButtons[i].y) < myButtons[i].r/2) 
    {
      //this is displayed if the mouse is pressde on a button
      myButtons[i].display(newColorButton);
      //isPressed[i] = true;
    } else {
      //this is displayed all the time 
      myButtons[i].display(buttonColor);
      isPressed[i] = false;
    }
    if (isMouseClicked == true && dist(mouseX, mouseY, myButtons[i].x, myButtons[i].y) < myButtons[i].r/2) {
      isPressed[i] = true;
    }
  }

  //Controls the Bolleans for wich page should be shown
  if (isPressed[0] == true) {
    pages[0] = true;
    startpage = false;
  }
  if (isPressed[1] == true) {
    pages[1] = true;
    startpage = false;
  }
  if (isPressed[2] == true) {
    pages[2] = true;
    startpage = false;
  }
  if (isPressed[3] == true) {
    pages[3] = true;
    startpage = false;
    whatQuiz[0] = true;
  }
}
