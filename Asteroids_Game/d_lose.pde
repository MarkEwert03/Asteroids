void lose() {
  background(red);

  //Text
  fill(white);
  text("You Lose", width/2, height/2);
  
}// -----------------------------------------------------------------------------------------

void loseMousedPressed() {
  mode = INTRO;
}// -----------------------------------------------------------------------------------------
