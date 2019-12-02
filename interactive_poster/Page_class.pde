class Page {
  float x;
  float y;
  float yspeed;
  PImage a;
  float maxSpeed = 10;
  int lastIndexPos;

  //varibales for the circular buffer
  int indexNum = 10;
  float [] mousePos = new float [indexNum];
  int indexPos = 0;


  Page(float x_, float y_, PImage a_) {
    x = x_;
    y = y_;
    a = a_;
  }
  void showPage() {
    image(a, x, y);
    
  }


  void slider() { 
    // small circular buffer that reads mouseX positions. This will be used when scrolling. 


    if (isMouseReleased) {
      mousePos[indexPos] = mouseY;
      lastIndexPos = indexPos;
      indexPos = (indexPos + 1) % indexNum;

      yspeed = -mousePos[indexPos] - -mousePos[lastIndexPos];


      if (yspeed < -maxSpeed) yspeed = -maxSpeed;
      if (yspeed > maxSpeed) yspeed = maxSpeed;

      if (y+yspeed < 0 || y+yspeed >= a.height) y = y + yspeed;
    }
  }
}
