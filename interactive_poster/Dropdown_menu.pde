class menu {

  float x, y, w, h, offset;
  int yLimit = 100;
  float speed = 2;
  boolean activate = false;
  boolean restart = false;

  float menuHRestore = 10;
  float speedReset = 0;



  menu(float _x, float _y, float _w, float _h, float _offset) {

    x = _x;
    y = _y;
    w = _w;
    h = _h;
    offset = _offset;
  }

  void show() {

    rectMode(CENTER);
    fill(255);
    rect(x, y, w, h, 10);
    if (mouseButton == LEFT && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      activate = true;
    }
  }

  void dropdown() {
    if (activate == true) {
      h = h + speed;
      y = y + speed/2;
    } 

      if (h >= yLimit) {
        speed = speedReset;
        activate = false;
        restart = true;
      }

      if (activate == false && mouseButton == LEFT && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
        speed = -2;
        h = h + speed*2;
        y = y + speed;
      }

      if (h == menuHRestore && activate == true) {
        speed = speedReset;
        restart = true;
      }
      
     


     
    }
  }
