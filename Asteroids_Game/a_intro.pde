void intro() {
  image(introPic, width/2, height/2);
  
  //Text
  fill(white);
  text("Asteroids", width/2, height/2);
}// -----------------------------------------------------------------------------------------

void introMousedPressed() {
  mode = GAME;
}// -----------------------------------------------------------------------------------------
