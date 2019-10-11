class Asteroid extends GameObject {
  //1. Instance Variables

  //2. Constructor(s)
  Asteroid() {
    size = 100;
    lives = 3;
    location = new PVector( random(width), random(height) );
    velocity = new PVector( random(-1, 1), random(-1, 1) );
    velocity.setMag( random(2) );
    velocity.rotate( random(TWO_PI) );
  }// -----------------------------------------------------------------------------------------

  Asteroid(int _size, float x, float y) {
    size = _size;
    lives = 3;
    location = new PVector( x, y );
    velocity = new PVector( random(-1, 1), random(-1, 1) );
    velocity.setMag( random(2) );
    velocity.rotate( random(TWO_PI) );
  }// -----------------------------------------------------------------------------------------

  //3. Behavior functions
  void show() {
    image(asteroidPic, location.x, location.y, size, size);
  }// -----------------------------------------------------------------------------------------

  void act() {
    super.act();

    for (int i = 0; i<objectList.size(); i++) {
      GameObject currentObject = objectList.get(i);
      if (currentObject instanceof Bullet) {
        if (dist(location.x, location.y, currentObject.location.x, currentObject.location.y) < size/2 + currentObject.size/2) {
          lives = 0;
          currentObject.lives = 0;
          if (15 <= size) {
            objectList.add( new Asteroid(size/2, location.x, location.y));
            objectList.add( new Asteroid(size/2, location.x, location.y));
          }
        }
      }
    }
  }// -----------------------------------------------------------------------------------------

}
