class Page {
  float x;
  float y;
  float yspeed;
  float maxSpeed = 10;
  
  //varibales for the circular buffer
  int indexNum = 10;
  float [] mousePos = new float [indexNum];
  int indexPos = 0;


  Page(float x_, float y_) {
    x = x_;
    y = y_;
  }
  void showPage(PImage a) {
    image(a, x, y);
  }
  void showPage() {
   
   line(x,x,y,y); 
  }
  
  void slider() { 
    // small circular buffer that reads mouseX positions. This will be used when scrolling. 
    mousePos[indexPos] = mouseY;
    if(mousePressed) indexPos = (indexPos + 1) % indexNum;
    yspeed = mousePos[0] - mousePos[1];
    if(yspeed < -maxSpeed) yspeed = -maxSpeed;
    if(yspeed > maxSpeed) yspeed = maxSpeed;
    if(mousePressed) y = y + yspeed;
  }
}
