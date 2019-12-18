void startPage () {
  
  image(StartPage, 0, 0);
  // creates the four buttons, and ads a hitbox to them.
  for (int i = 0; i < myButtons.length; i++) 
  {
    myButtons[i] = new Button(buttonX[i], buttonY[i], buttonR1[i], buttonR2[i], buttonCurve);
    if(mousePressed && mouseX > myButtons[i].x && mouseX < myButtons[i].x + myButtons[i].r && mouseY > myButtons[i].y && mouseY < myButtons[i].y + myButtons[i].r1)
    {
      //this is displayed if the mouse is pressde on a button
      myButtons[i].display(newColorButton);
    } else {
      //this is displayed all the time 
      myButtons[i].display(buttonColor);
      isPressed[i] = false;
    }
    if (isMouseClicked && mouseX > myButtons[i].x && mouseX < myButtons[i].x + myButtons[i].r && mouseY > myButtons[i].y && mouseY < myButtons[i].y + myButtons[i].r1) {
      isPressed[i] = true;
    }
  }

  //Controls the Booleans for which page should be shown
  for (int i = 0; i < pages.length; i++) {
    if (isPressed[i]) {
      press.play();
      pages[i] = true;
      startpage = false;
      if( i == 3) whatQuiz[0] = true; //This is what makes the code in line 102 work.
    }

  }
}
