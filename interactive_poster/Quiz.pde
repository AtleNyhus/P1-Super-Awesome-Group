class Quiz {

  Boolean [] circleChecker = {false, false, false}; 

  int ellipseYStart;
  int incrementDown = 120;
  int incrementLeft = 50;
  int endPoint = 675;
  int multiplyer = 2;

  float [] miniEllipseY = new float [3];
  boolean toggle = true; //toggle used to turn off that you can click on more than 1 answer.
  boolean blankReset = true; //Resets the quiz page back so there is no black circles
  boolean stopScore = true; //Made so you cannot just spam the same button to get infinite points
  boolean outOfBounds = false; //So the array does not go over its capacity

  String [] answers = loadStrings("answers.txt");


  int score;

  //Next button variables
  float rectX, rectY, rectSize;

  Quiz(float temp_ellipseX, int temp_ellipseYStart, int temp_ellipseSize, float temp_rectX, float temp_rectY, float temp_rectSize) {
    ellipseYStart = temp_ellipseYStart;
    ellipseX = temp_ellipseX;
    ellipseSize = temp_ellipseSize;
    rectX = temp_rectX;
    rectY = temp_rectY;
    rectSize = temp_rectSize;
  }

  void Body() {

    //The question box
    stroke(0);
    fill(255);
    rect(540, 200, width/1.1, height/8);

    //The clickable circles for answers
    for (int i = ellipseYStart; i < endPoint; i = i + incrementDown) { //Draws empty circles
      ellipse(ellipseX, i, ellipseSize, ellipseSize);
    }

    printArray(answers);

    fill(0);
    textSize(20);
    text("score " + score, 300, 110);
  }


  void Interact() { //Checks what button you click on. Turns off when you click within one of the buttons. Sets 1 of the buttons to be true.
    if (toggle) {
      for (int u = 0; u < 3; u++) { //You can click on each circle to fill it with another smaller black circle
        if (mousePressed && dist(mouseX, mouseY, ellipseX, miniEllipseY[u]) < ellipseSize/2) {
          toggle = false;
          circleChecker [u] = true; //circleChecker is used to only make 1 of the buttons true and run the code on line 70.
          blankReset = true;
        }
      }
    }


    //Creates next button
    if (outOfBounds == false) { //does not show if the array is out of bounds
      fill(255, 0, 0);
      rectMode(CENTER);
      rect(rectX, rectY, rectSize, rectSize);
    }
    if (outOfBounds == false && toggle == false && isMouseClicked == true && mouseX > rectX-rectSize/2 && mouseX < rectX + rectSize/2 && mouseY > rectY-rectSize/2 && mouseY < rectY + rectSize/2) { //hitbox for next button so you can go to the next question.
      quizIndex++;
      toggle = true; 
      correctAnswers[0] = correctAnswers[quizIndex]; //follows quizIndex for the correct answer.
      blankReset = false;
      stopScore = true;
    }

    if (quizIndex >= 9) {
      outOfBounds = true;
    }

    for(int i = 0; i < 
    if (quizIndex == 0) { //The answers are written in the programme
      text(answers[0], ellipseX+incrementLeft, ellipseYStart);
      text(answers[1], ellipseX+incrementLeft, ellipseYStart+incrementDown);
      text(answers[2], ellipseX+incrementLeft, ellipseYStart+incrementDown*multiplyer);
    }

    if (quizIndex == 1) {
      text(answer1, ellipseX+incrementLeft, ellipseYStart);
      text(answer2, ellipseX+incrementLeft, ellipseYStart+incrementDown);
      text(answer3, ellipseX+incrementLeft, ellipseYStart+incrementDown*multiplyer);
    }

    if (quizIndex == 2) {
      text(answer1, ellipseX+incrementLeft, ellipseYStart);
      text(answer2, ellipseX+incrementLeft, ellipseYStart+incrementDown);
      text(answer3, ellipseX+incrementLeft, ellipseYStart+incrementDown*multiplyer);
    }

    if (quizIndex == 3) {
      text(answer1, ellipseX+incrementLeft, ellipseYStart);
      text(answer2, ellipseX+incrementLeft, ellipseYStart+incrementDown);
      text(answer3, ellipseX+incrementLeft, ellipseYStart+incrementDown*multiplyer);
    }

    if (quizIndex == 4) {
      text(answer1, ellipseX+incrementLeft, ellipseYStart);
      text(answer2, ellipseX+incrementLeft, ellipseYStart+incrementDown);
      text(answer3, ellipseX+incrementLeft, ellipseYStart+incrementDown*multiplyer);
    }

    if (quizIndex == 5) {
      text(answer1, ellipseX+incrementLeft, ellipseYStart);
      text(answer2, ellipseX+incrementLeft, ellipseYStart+incrementDown);
      text(answer3, ellipseX+incrementLeft, ellipseYStart+incrementDown*multiplyer);
    }


    //Depending on which circle gets clicked on there is draw another on top and not the others.
    for (int i = 0; i < circleChecker.length; i++) { 
      if (circleChecker [i] && blankReset == true) {
        fill(0);
        ellipse(ellipseX, miniEllipseY[i], ellipseSize/1.5, ellipseSize/1.5);
      } else {
        circleChecker[i] = false;
      }
    }

    //The black ellipse positions. Corresponds to the other circles y-positions.
    for (int i = 0; i < 3; i++) { 
      miniEllipseY[i] = i*incrementDown+ellipseYStart;
    }
  }


  void correct(int a) { //Gives +1 score if the right answer is pressed.
    if (stopScore == true && isMouseClicked == true && dist(mouseX, mouseY, ellipseX, miniEllipseY[a]) < ellipseSize/2) {
      score++;
      fill(0, 0, 255);
      ellipse(ellipseX, miniEllipseY[a], ellipseSize/1.5, ellipseSize/1.5);
      stopScore = false;
    }
  }

  void nextQuiz() {
    if (isMouseClicked && toggle == false) { //If mouse is clicked the loop gets deloaded and quizIndex is incremented by 1, which is put into whatQuiz that controls which quiz question is on.
      for (int i = 0; i < whatQuiz.length; i++) { //Deloads quizpages first.
        whatQuiz[i] = false;
      }
      whatQuiz[quizIndex] = true;
    }
  }
}
