class Button {
  float x;
  float y;
  float r;
  float r1;
  float edge;
  //color c;

  Button(float x_, float y_, float r_, float r1_, float edge_) {
    x = x_;
    y = y_;
    r = r_;
   // c = c_;
    r1 = r1_;
    edge = edge_;
  }

  void display(color c) {
    fill(c);
    rectMode(CENTER);
    rect(x, y, r, r1, edge);
  }


}
