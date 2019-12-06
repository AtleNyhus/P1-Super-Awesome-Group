class Quiz {

  Boolean [] test1 = {false, false, false}; 

  int ellipseYStart;
  int increment = 120;
  int endPoint = 675;

  float [] miniEllipseY = new float [3];
  boolean toggle = true; //toggle used to turn off that you can click on more than 1 answer.
 

  int score;

  //Next button variables
  float rectX, rectY, rectSize;

  Quiz(float temp_ellipseX, int temp_ellipseYStart, int temp_ellipseSize) {
    ellipseYStart = temp_ellipseYStart;
    ellipseX = temp_ellipseX;
    ellipseSize = temp_ellipseSize;
  }

  Quiz(float temp_rectX, float temp_rectY, float temp_rectSize) {
    rectX = temp_rectX;
    rectY = temp_rectY;
    rectSize = temp_rectSize;
  }

  void Body() {

    stroke(0);
    fill(255);
    rect(540, 200, width/1.1, height/8);

    for (int i = ellipseYStart; i < endPoint; i = i + increment) { //Draws empty circles
      ellipse(ellipseX, i, ellipseSize, ellipseSize);
    }


    fill(0);
    textSize(20);
    text("score " + score, 300, 110);
  }


  void button() {
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(rectX, rectY, rectSize, rectSize);
    if(isMouseClicked == true && mouseX > rectX-rectSize/2 && mouseX < rectX + rectSize/2 && mouseY > rectY-rectSize/2 && mouseY < rectY + rectSize/2) { //hitbox for next button so you can go to the next question.
      quizIndex++;
      
    }
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



    for (int i = 0; i < 3; i++) { //The black ellipse positions. Corresponds to the other circles y-positions.
      miniEllipseY[i] = i*increment+ellipseYStart;
    }
  }


  void correct(int a) { 
    if (mousePressed && dist(mouseX, mouseY, ellipseX, miniEllipseY[a]) < ellipseSize/2) {
      score++;
      fill(0, 0, 255);
      ellipse(ellipseX, miniEllipseY[a], ellipseSize/1.5, ellipseSize/1.5);
    }
  }

  void nextQuiz() {
    if (isMouseClicked) { //If mouse is clicked the loop gets deloaded and quizIndex is incremented by 1, which is put into whatQuiz that controls which quiz question is on.
      for (int i = 0; i < whatQuiz.length; i++) { //Deloads quizpages first.
        whatQuiz[i] = false;
      }
      whatQuiz[quizIndex] = true;
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
