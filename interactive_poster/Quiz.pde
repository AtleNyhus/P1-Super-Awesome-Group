class Quiz {
  int Resultat = 0;

  Boolean [] test1 = {false, false, false}; 

  float ellipseY1 = 125;

  float [] miniEllipseY = new float [3];
  boolean toggle = true; //toggle used to turn off that you can click on more than 1 answer.
  int result;
  float score;

  Quiz(float temp_ellipseX, int temp_ellipseSize) {

    ellipseX = temp_ellipseX;
    ellipseSize = temp_ellipseSize;
  }

  void Body() {

    stroke(0);
    fill(255);
    rect(540, 200, width/1.1, height/8);

    for (int i = 125*3; i < 225*3; i = i + 40*3) {
      ellipse(ellipseX, i, ellipseSize, ellipseSize);
    }


    fill(0);
    textSize(20);
    text("score " + score, 300, 110);
  }



  void Interact() { //Checks what button you click on. Turns off when you click within one of the buttons. Sets 1 of the buttons to be true.
    if (toggle) {
      for (int u = 0; u < 3; u++) { //You can click on each circle to fill it with another smaller black circle
        if (mousePressed && dist(mouseX, mouseY, ellipseX, miniEllipseY[u]) < ellipseSize/2) {
          toggle = false;
          test1 [u] = true;
        }
      }
    }


    for (int i = 0; i < test1.length; i++) { //Depending on which circle gets clicked on there is draw another on top and not the others.
      if (test1 [i]) {
        fill(0);
        ellipse(ellipseX, miniEllipseY[i], ellipseSize/1.5, ellipseSize/1.5);
      }
    }


    if (mousePressed && dist(mouseX, mouseY, ellipseX, miniEllipseY[0]) < ellipseSize/2) {
      score = 2;
    }

    for (int i = 0; i < 3; i++) { //The black ellipse positions. Corresponds to the other circles y-positions.
      miniEllipseY[i] = i*40*3+125*3;
    }
  }


  void correct(int a) {
    if (mousePressed && dist(mouseX, mouseY, ellipseX, miniEllipseY[a]) < ellipseSize/2) {
      score++;
      fill(0,0,255);
      ellipse(ellipseX, miniEllipseY[a], ellipseSize/1.5, ellipseSize/1.5);
    }
  }
}

/*
void mousePressed () {
 if (mousePressed && mouseButton == LEFT) {
 fill(0);
 {
 ellipse(width/8, height/4, ellipseSize/1.5, ellipseSize/1.5);
 }
 }
 }*/
