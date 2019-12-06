class Button {
  float x;
  float y;
  float r;
  float r1;
  PImage image;
  //color c;
  // boolean active;

  Button(float x_, float y_, float r_, float r1_) {
    x = x_;
    y = y_;
    r = r_;
    r1 = r1_;
  }

  Button(float x_, float y_, float r_, float r1_, PImage image_) {
    x = x_;
    y = y_;
    r = r_;
    r1 = r1_;
    image = image_;
  }

  void display(color c) {
    fill(c);
    rectMode(CENTER);
    rect(x, y, r, r1);
  }
  void display() {
    image(image, x, y);
  }
  
  void nextQuiz(){
    for(int i = 0; i < whatQuiz.length; i++){ //Deloads quizpages first.
      whatQuiz[i] = false;
    }
    quizIndex++;
    whatQuiz[quizIndex] = true;
    
  }
}
