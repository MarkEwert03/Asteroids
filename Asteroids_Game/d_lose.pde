void lose() {
  background(red);

  //Text
  textSize(120);
  fill(white);
  text("You Lose", width/2, height/2);

  //Ship variable reset
  myShip.location.set(width/2, height/2);
  myShip.velocity.set(0, 0);
  myShip.direction.set(0, -0.1);
}// -----------------------------------------------------------------------------------------

void loseMousedPressed() {
  mode = INTRO;
  objectList.clear();
  objectList.add( new Ship());
}// -----------------------------------------------------------------------------------------
