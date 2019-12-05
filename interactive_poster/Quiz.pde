int Resultat = 0;
int ellipseSize = 25;
float ellipseX = 62.5;
float ellipseY1 = 125;

float [] miniEllipseY = new float [3];
boolean toggle = true; //toggle used to turn off that you can click on more than 1 answer.
int result;
float score;

void Quiz(){

  stroke(0);
  rect(25, 25, width/1.1, height/8);

  for (int i = 125; i < 225; i = i + 40) {
    ellipse(ellipseX, i, ellipseSize, ellipseSize);
  }


  /*stroke(0);
   rect(25,25,width/1.1,height/8);
   
   ellipse(width/8,height/4,25,25);{
   if (mousePressed && mouseButton == LEFT){
   fill(0);
   }
   }
   ellipse(width/8,height/3,25,25);
   ellipse(width/8,height/2.4,25,25);
   */
   
  fill(0);
  textSize(20);
  text("score " + score, 300, 110);

  if (toggle) {
    for (int u = 0; u < 3; u++) { //You can click on each circle to fill it with another
      if (mousePressed && dist(mouseX, mouseY, ellipseX, miniEllipseY[u]) < ellipseSize/2) {
        fill(0);
        ellipse(ellipseX, miniEllipseY[u], ellipseSize/1.5, ellipseSize/1.5);
        toggle = false;
      }
    }
  }
  
  if(mousePressed && dist(mouseX, mouseY, ellipseX, miniEllipseY[0]) < ellipseSize/2) {
    score = 2;
  }
  
  for (int i = 0; i < 3; i++) { //Array gets filled with values
    miniEllipseY[i] = i*40+125;
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
