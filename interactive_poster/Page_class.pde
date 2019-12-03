class Page {
  float x;
  float y;
  float yspeed;
  PImage a;
  float maxSpeed = 10;
  int lastIndexPos;




  Page(float x_, float y_, PImage a_) {
    x = x_;
    y = y_;
    a = a_;
  }
  void showPage() {
    image(a, x, y);
    
  }


  void slider() { 
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
      if (y+yspeed < 0 || y+yspeed >= a.height) y = y + yspeed;
    }
  }
}
