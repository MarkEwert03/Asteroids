class Asteroid extends GameObject {
  //1. Instance Variables

  //2. Constructor(s)
  Asteroid() {
    size = 100;
    lives = 3;
    location = new PVector( random(width), random(height) );
    velocity = new PVector( random(-1, 1), random(-1, 1) );
    velocity.setMag( random(1, 3) );
    velocity.rotate( random(TWO_PI) );
  }// -----------------------------------------------------------------------------------------

  Asteroid(int _size, float x, float y) {
    size = _size;
    lives = 3;
    location = new PVector( x, y );
    velocity = new PVector( random(-1, 1), random(-1, 1) );
    velocity.setMag( random(0.5, 2) );
    velocity.rotate( random(TWO_PI) );
  }// -----------------------------------------------------------------------------------------

  //3. Behavior functions
  void show() {
    image(asteroidPic, location.x, location.y, size, size);
  }// -----------------------------------------------------------------------------------------

  void act() {
    super.act();

    //0. Loop
    for (int i = 0; i < objectList.size(); i++) {
      GameObject currentObject = objectList.get(i);
      //1. If object is a bullet
      if (currentObject instanceof Bullet) {
        //2. If asteroid is touching the bullet
        if (dist(location.x, location.y, currentObject.location.x, currentObject.location.y) < size/2 + currentObject.size/2) {
          lives = 0; //Asteroids lives
          currentObject.lives = 0; //Bullets lives
          score+= map(size, 0, 125, 1000, 10000);
          //3. Particle loop
          for (int j = 0; j <100; j++) {
            objectList.add( new Particle(location.x+random(-size/2, size/2), location.y+random(-size/2, size/2)));
          }//3.
          //3. Only add two new ones if asteroid isn't too small
          if (45 <= size) {
            objectList.add( new Asteroid(size/2, location.x, location.y));
            objectList.add( new Asteroid(size/2, location.x, location.y));
          } //3.
        }//2.
      }//1.
    }//0.
  }// -----------------------------------------------------------------------------------------
}
