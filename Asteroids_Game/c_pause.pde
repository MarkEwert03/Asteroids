void pause() {
  background(white);

  for (int i = 0; i < objectList.size(); i++) {
    GameObject currentObject = objectList.get(i);
    currentObject.show();
  }

  //Text
  fill(black);
  text("Pause", width/2, height/2);
}// -----------------------------------------------------------------------------------------

void pauseMousedPressed() {
  mode = GAME;
}// -----------------------------------------------------------------------------------------
