class Page {
  float x;
  float y;
  float yspeed;
  PImage a;
  float maxSpeed = 20;
  int lastIndexPos;




  Page(float x_, float y_, PImage a_) {
    x = x_;
    y = y_;
    a = a_;
  }
  void showPage() {
    imageMode(CORNER);
    image(a, x, y);
    

    
  }
  /*
  void startPage () {
  // creates the four buttons, and ads a hitbox to them.
  image(a,x,y);
  
  for (int i = 0; i <= myButtons.length-1; i++) 
  {
    myButtons[i] = new Button(buttonX[i], buttonY[i], buttonR1[i], buttonR2[i]);
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


}
*/


  void slider(float max) { 
    // "isMousePressed" is tied to the "mousePressed" and "mouseReleased" functions 
    if (isMousePressed) {
      // small circular buffer that reads mouseX positions. 
      mousePos[indexPos] = mouseY;
      lastIndexPos = indexPos;
      indexPos = (indexPos + 1) % indexNum;
      
      //Sets the yspeed to be the difference between the current mouspos and the last. They are set to minus since we want to scroll down when we scroll up.
      yspeed = -mousePos[indexPos] - -mousePos[lastIndexPos];
      
      //Makes sure the app cant scroll faster then "maxspeed"
      if (yspeed < -maxSpeed) yspeed = -maxSpeed;
      if (yspeed > maxSpeed) yspeed = maxSpeed;
      
      //makes sure the app do not scroll out of bounds
      if (this.y + yspeed <= 0 && this.y + yspeed >= -max + height) this.y = this.y + yspeed;
    }
  }
}
