void startPage () {

  for (int i = 0; i <= myButtons.length-1; i++) 
  {
    myButtons[i] = new Button(buttonX[i], buttonY[i], buttonR[i], buttonR[i]);
    //myButtons[i].active = true; //This sets all the "myButtons" to the true state (means they can be displayed)
    if ( mousePressed && dist(mouseX, mouseY, myButtons[i].x, myButtons[i].y) < myButtons[i].r/2) 
    {
      myButtons[i].display(newColorButton);
      isPressed[i] = true;
    } else {
      myButtons[i].display(buttonColor);
      isPressed[i] = false;
    }
  }
  
  if(isPressed[0] == true) {
    pages[0] = true;
    startpage = false;
  }
  if(isPressed[1] == true){
    pages[1] = true;
    startpage = false;
  }
  if(isPressed[2] == true) {
    pages[2] = true;
    startpage = false;
  }
  if(isPressed[3] == true) {
    pages[3] = true;
    startpage = false;
  }
}
