void win() {
  image(winPic, width/2, height/2);

  //Text
  textSize(120);
  fill(white);
  text("You WIN", width/2, height/4);
  textSize(64);
  text("New High Score is " + highScore, width/2, height/1.5);
}// -----------------------------------------------------------------------------------------

void winMousedPressed() {
  setup();

  mode = INTRO;
}// -----------------------------------------------------------------------------------------
