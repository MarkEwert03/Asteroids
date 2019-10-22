void lose() {
  background(red);

  //Text
  textSize(120);
  fill(white);
  text("You Lose", width/2, height/2);
}// -----------------------------------------------------------------------------------------

void loseMousedPressed() {
  objectList.clear();
  objectList.add(myShip);

  //Ship reset
  myShip.location.set(width/2, height/2);
  myShip.velocity.set(0, 0);
  myShip.direction.set(0, -0.1);
  
  //Other reset
  score = 0;

  mode = INTRO;
}// -----------------------------------------------------------------------------------------
