void pause() {
  background(white);

  for (int i = 0; i < objectList.size(); i++) {
    GameObject currentObject = objectList.get(i);
    currentObject.show();
  }

  //Pause text
  fill(black);
  textSize(64);
  text("Pause", width/2, height/2);

  //Lives
  textSize(24);
  fill(livesColor);
  text("Lives: ", width/16, height/16);
  text(myShip.lives-1, width/8, height/16);

  //Score
  textSize(24);
  fill(black);
  text("Score: ", width*3/4, height/16);
  text(score, width*7/8, height/16);

  //Highscore
  if (highScoreColor == mint) fill(highScoreColor);
  else fill(0);
  text("High Score: ", width*23/32, height/8);
  text(highScore, width*7/8, height/8);
}// -----------------------------------------------------------------------------------------

void pauseMousedPressed() {
  mode = GAME;
}// -----------------------------------------------------------------------------------------
