void lose() {
  image(losePic, width/2, height/2);

  //Text
  textSize(120);
  fill(white);
  text("You Lose", width/2, height/4);
  textSize(64);
  text("Your score was " + score, width/2, height/1.5);
}// -----------------------------------------------------------------------------------------

void loseMousedPressed() {
  setup();

  mode = INTRO;
}// -----------------------------------------------------------------------------------------
