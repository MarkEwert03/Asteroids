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
      if (highScoreColor == mint) mode = WIN;
      else mode = LOSE;
    }//1.
  }//0.t

  //Asteroid
  asteroidTimer--;
  if (asteroidTimer <= 0) {
    asteroidTimer = int(random(240, 360));
    objectList.add( new Asteroid(int(random(75, 125)), 850, 650));
  }

  //UFO
  ufoTimer--;
  if (ufoTimer <= 0) {
    ufoTimer = 900;
    objectList.add( new UFO(50, random(-25, + width/2), 650) );
  }

  //Pause Button
  if (dist(mouseX, mouseY, width-20, height-20) < 50) {
    strokeWeight(5);
    stroke(white);
  } else noStroke();
  fill(white);
  ellipse(width-30, height-30, 50, 50);

  //Lives
  if (myShip.lives-1 == 3) livesColor = yellow;
  if (myShip.lives-1 == 2) livesColor = orange;
  if (myShip.lives-1 == 1) livesColor = red;
  textSize(24);
  fill(livesColor);
  text("Lives: ", width/16, height/16);
  text(myShip.lives-1, width/8, height/16);

  //Score
  textSize(24);
  fill(white);
  text("Score: ", width*3/4, height/16);
  text(score, width*7/8, height/16);

  //HighScore
  if (highScore < score) {
    highScore = score;
    highScoreColor = mint;
  }
  fill(highScoreColor);
  text("High Score: ", width*23/32, height/8);
  text(highScore, width*7/8, height/8);
}// -----------------------------------------------------------------------------------------

void gameMousedPressed() {
  if (dist(mouseX, mouseY, width-30, height-30) < 50) mode = PAUSE;
}// -----------------------------------------------------------------------------------------
