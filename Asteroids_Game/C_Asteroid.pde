class Asteroid extends GameObject {
  //1. Instance Variables

  //2. Constructor(s)
  Asteroid() {
    location = new PVector( random(0, width), random(0, height) );
    velocity = new PVector( random(-1, 1), random(-1, 1) );
    velocity.setMag(1);
  }

  //3. Behavior functions
  void show() {
    image(asteroidPic, location.x, location.y, lives, lives);
  }// -----------------------------------------------------------------------------------------

  void act() {
    super.act();

    for (int i = 0; i<objectList.size(); i++) {
      GameObject currentObject = objectList.get(i);
      if (currentObject instanceof Bullet) {
        if (dist(location.x, location.y, currentObject.location.x, currentObject.location.y) < SHIPSIZE/2 + ASTEROIDSIZE/2) {
          lives = 0;
        }
      }
    }
  }// -----------------------------------------------------------------------------------------

  boolean alive() {
    return true;

    //if (dist(location.x, location.y, myShip.location.x, myShip.location.y) < OBJECTSIZE) return false;
  }// -----------------------------------------------------------------------------------------
}
