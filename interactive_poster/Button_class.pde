class Button {
  float x;
  float y;
  float r;
  float r1;
  color c;

  Button(float x_, float y_, float r_, float r1_, color c_) {
    x_ = x;
    y_ = y;
    r_ = r;
    c_ = c;
    r1_ = r1;
  }

  void display() {
    rectMode(CENTER);
    fill(c);
    rect(x, y, r, r1);
  }

  void ifPressed(Button a, color newColor) {
    this.c = newColor;
  }
}
