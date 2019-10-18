void win() {
  background(purple);

  //Text
  textSize(120);
  fill(white);
  text("You WIN", width/2, height/2);
}// -----------------------------------------------------------------------------------------

void winMousedPressed() {
  mode = INTRO;
}// -----------------------------------------------------------------------------------------
