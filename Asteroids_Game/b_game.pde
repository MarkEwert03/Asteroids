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
    //1. When ship is dead
    if (currentObject.lives == 1) {
      myShip.lives = 4;
      mode = LOSE;
    }//1.
  }//0.t

  //Asteroid
  asteroidTimer--;
  if (asteroidTimer <= 0) {
    asteroidTimer = int(random(120, 240));
    objectList.add( new Asteroid(int(random(75, 125)), 850, 650));
  }

  //UFO
  ufoTimer--;
  if (ufoTimer <= 0) {
    ufoTimer = 60000;
    objectList.add( new UFO(int(random(25, 75)), 850, 650) );
  }

  //Pause Button
  if (dist(mouseX, mouseY, width-20, height-20) < 50) {
    strokeWeight(5);
    stroke(white);
  } else noStroke();
  fill(white);
  ellipse(width-30, height-30, 50, 50);

  //Lives
  textSize(24);
  fill(white);
  text("Lives: ", width/16, height/16);
  text(myShip.lives-1, width/8, height/16);

  //Score
  textSize(24);
  fill(white);
  text("Score: ", width*3/4, height/16);
  text(score, width*15/16, height/16);
}// -----------------------------------------------------------------------------------------

void gameMousedPressed() {
  if (dist(mouseX, mouseY, width-30, height-30) < 50) mode = PAUSE;
}// -----------------------------------------------------------------------------------------
