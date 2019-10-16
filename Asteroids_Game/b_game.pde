void game() {
  //Basic
  background(black);
  
  //0. Game Object
  for (int i = 0; i < objectList.size(); i++) {
    GameObject currentObject = objectList.get(i);
    currentObject.show();
    currentObject.act();
    //1. Removes them when they are "dead"
    if (currentObject.lives == 0) {
      objectList.remove(i);
      i--;
    }//1.
  }//0.
  
  //Pause Button
  if (dist(mouseX, mouseY, width-20, height-20) < 50) {
    strokeWeight(5);
    stroke(white);
  } else noStroke();
  fill(white);
  ellipse(width-30, height-30, 50, 50);
  
  if (myShip.lives == 0) mode = LOSE;
}// -----------------------------------------------------------------------------------------

void gameMousedPressed() {
  if (dist(mouseX, mouseY, width-30, height-30) < 50) mode = PAUSE;
}// -----------------------------------------------------------------------------------------
