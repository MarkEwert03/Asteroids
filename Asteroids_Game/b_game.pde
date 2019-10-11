void game() {
  //Basic
  background(black);
  
  
  //Game Object
  for (int i = 0; i < objectList.size(); i++) {
    GameObject currentObject = objectList.get(i);
    currentObject.show();
    currentObject.act();
    if (currentObject.lives == 0) {
      objectList.remove(i);
      i--;
    }
  }
}

void gameMousedPressed() {
  mode = LOSE;
}
