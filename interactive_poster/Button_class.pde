class Button {
  float x;
  float y;
  float r;
  float r1;
  float curve;
  PImage image;
  //color c;
  // boolean active;

  Button(float x_, float y_, float r_, float r1_, float curve_) {
    x = x_;
    y = y_;
    r = r_;
    r1 = r1_;
    curve = curve_;
  }
  /*
  Button(float x_, float y_, float r_, float r1_, PImage image_) {
   x = x_;
   y = y_;
   r = r_;
   r1 = r1_;
   image = image_;
   }
   */
  void display(color c) {
    noStroke();
    fill(c);
    rectMode(CORNER);
    rect(x, y, r, r1, curve);
  }

  void home (color homeColor) {
    fill(homeColor);
    rectMode(CENTER);
    rect(x, y, r, r1);
    if ( mousePressed && dist(mouseX, mouseY, this.x, this.y) < this.r/2) {
      for (int i = 0; i < num; i++) {
        pages[i] = false;
        page[i].y = 0;
      }
      startpage = true;
    }
  }


  /*
  void display() {

    image(image, x, y);
  }
  
   rectMode(CORNER);
   image(image, x, y);
   }
   }
   */

}
