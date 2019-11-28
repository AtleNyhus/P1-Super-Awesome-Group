class Button {
  float x;
  float y;
  float r;
  float r1;
  //color c;
 // boolean active;

  Button(float x_, float y_, float r_, float r1_) {
    x = x_;
    y = y_;
    r = r_;
    // c = c_;
    r1 = r1_;
  }

  void display(color c) {
   // if (this.active == false) return;
   // else {
      fill(c);
      rectMode(CENTER);
      rect(x, y, r, r1);
   // }
  }
}
