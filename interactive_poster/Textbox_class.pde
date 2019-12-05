int x1 = 540;
int y1 = 960;
int w1 = 540;
int h1 = 960;

int x2 = x1 + 200;
int y2 = y1-430;
int size = 50;

int edge = 50;
boolean show = true;

PImage introText;

void boxShow() {
  if (show) {
    rectMode(CENTER);

    fill(255);
    rect(x1, y1, w1, h1, edge);
    rect(x2, y2, size+20, size, edge);
    fill(0);
    text("Gå videre", x2-20, y2);
    introText = loadImage("bla bla.jpg");
    image(introText, x1, y1);
  }

  if (mousePressed && mouseX > x2-size/2 && mouseX < x2+size/2 && mouseY > y2-size/2 && mouseY < y2+size/2) {
    show = false;
          startpage = true;
  }
}
