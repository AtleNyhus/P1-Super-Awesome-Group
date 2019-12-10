class Quiz {

  boolean [] circleChecker = {false, false, false}; 

  int ellipseYStart;
  int incrementDown = 120;
  int incrementLeft = 50;
  int endPoint = 800;
  int multiplyer = 2;
  int triple = 3; //Used to shift the answers array to the next spot. Changed by quizIndex.
  int textSize = 30;
  float questionBoxX = width * 0.115;
  float questionBoxY = 150;
  int questionBoxW = 800;
  int questionBoxH = 200;
  float scoreBoxX = width*0.53;
  float scoreBoxY = 830;
  int scoreBoxW = 150;
  int scoreBoxH = 50;
  float scoreTextX = width*0.55;
  float scoreTextY = height*0.45;
  float questionTextX = 550;
  float questionTextY = 250;

  float [] miniEllipseY = new float [3];
  boolean toggle = true; //toggle used to turn off that you can click on more than 1 answer.
  boolean blankReset = true; //Resets the quiz page back so there is no black circles
  boolean stopScore = true; //Made so you cannot just spam the same button to get infinite points
  boolean outOfBounds = false; //So the array does not go over its capacity



  String [] answers = loadStrings("answers.txt"); //Pulls text from a textfile and loads each line into an array
  String [] questions = loadStrings("questions.txt"); //Questions from the textfile

  int score;
  int circleClicked; //Should be used to show the score when you click the last answer
  boolean circleOn = false;//Should be used to show the score when you click the last answer
  boolean circleChecked = true; //Used so you can't click and increase circleClicked infinetly

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
    rect(questionBoxX, questionBoxY, questionBoxW, questionBoxH); 

    //The clickable circles for answers
    for (int i = ellipseYStart; i < endPoint; i = i + incrementDown) { //Draws empty circles
      strokeWeight(1);
      ellipse(ellipseX, i, ellipseSize, ellipseSize);
    }

    //Score box
    if (circleClicked == quiz.length) { 
      rect(scoreBoxX, scoreBoxY, scoreBoxW, scoreBoxH); //fix magic numbers
      fill(0);
      textSize(textSize);
      text("score " + score, scoreTextX, scoreTextY);
    }
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

    if (circleChecked) {
      for (int u = 0; u < 3; u++) {
        if (isMouseClicked == true && dist(mouseX, mouseY, ellipseX, miniEllipseY[u]) < ellipseSize/2) {
          circleOn = true;
          circleChecked = false;
        }
      }
      if (circleOn) {
        circleClicked++;
        circleOn = false;
      }
    }

    println(circleClicked);

    //Creates next button
    if (outOfBounds == false) { //does not show if the array is out of bounds
      rectMode(CENTER);
      fill(255);
      rect(rectX, rectY, rectSize*3, rectSize, 50);
      fill(0);
      textSize(30);
      text("Næste", rectX-45, rectY+3);
    }//hitbox for next button so you can go to the next question. 
    if (outOfBounds == false && toggle == false && isMouseClicked == true && mouseX > rectX-rectSize/2 && mouseX < rectX + rectSize/2 && mouseY > rectY-rectSize/2 && mouseY < rectY + rectSize/2) { 
      quizIndex++;
      toggle = true; 
      correctAnswers[0] = correctAnswers[quizIndex]; //follows quizIndex for the correct answer.
      blankReset = false;
      stopScore = true;
      circleChecked = true;
    }


    if (quizIndex >= quiz.length-1) {
      outOfBounds = true;
    }

    for (int i = 0; i < quiz.length; i++) { //When quizIndex is equals to i it shows the text bellow. The loop goes from 0 to 9
      if (quizIndex == i) { //The answers are written in the programme
        fill(255); 
        textSize(textSize);
        text(answers[0+(quizIndex*triple)], ellipseX+incrementLeft, ellipseYStart);//answers[0] gets added with a multiplication of quizIndex times 3. So quizIndex = 1*3 changes answers[0] to answers[3]
        text(answers[1+(quizIndex*triple)], ellipseX+incrementLeft, ellipseYStart+incrementDown);
        text(answers[2+(quizIndex*triple)], ellipseX+incrementLeft, ellipseYStart+incrementDown*multiplyer);
        fill(0);
        textSize(35);
        rectMode(CENTER); //Fixes bug where the last question is not displayed properly
        text(questions[quizIndex], questionTextX, questionTextY, 800, 100);
      }
    }



    //Depending on which circle gets clicked on there is draw another on top and not the others.
    for (int i = 0; i < circleChecker.length; i++) { 
      if (circleChecker [i] && blankReset == true) {

        fill(255, 0, 0); //The circle is red and is left there or overwritten by the green circle further on line 154.
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
      stopScore = false;
    } 
    if (toggle == false) {
      fill(0, 255, 0);
      ellipse(ellipseX, miniEllipseY[a], ellipseSize/1.5, ellipseSize/1.5);
    }
  }
  /*
  void nextQuiz() { //Is not used in the programme
   if (isMouseClicked && toggle == false) { //If mouse is clicked the loop gets deloaded and quizIndex is incremented by 1, which is put into whatQuiz that controls which quiz question is on.
   for (int i = 0; i < whatQuiz.length; i++) { //Deloads quizpages first.
   whatQuiz[i] = false;
   }
   whatQuiz[quizIndex] = true;
   }
   }*/
}
