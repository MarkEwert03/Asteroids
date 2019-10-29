class UFO extends GameObject {
  //1. Instance Variables
  PVector direction;
  int directionTimer, shotTimer, threshold;

  //2. Constructor(s)
  UFO(int _size, float _x, float _y) {
    size = _size;
    lives = 4;
    location  = new PVector(_x, _y);
    direction = new PVector(width/2-location.x, height/2-location.y);
    velocity  = new PVector(0, 0);
    velocity.setMag(3);
    directionTimer = 10;
    shotTimer = 120;
    threshold = 0;
  }// -----------------------------------------------------------------------------------------

  //3. Behavior functions
  void show() {
    image(ufoPic, location.x, location.y, size, size);
  }// -----------------------------------------------------------------------------------------

  void act() {
    //Moves
    location.add(velocity);

    //Sets directions
    directionTimer--;
    if (directionTimer > 0) direction.set(width/2-location.x, height/2-location.y);

    //Sets velocity
    velocity.add(direction);
    velocity.setMag(2);

    //Changes directions back to facing center
    if (location.x < -size/2) {
      location.x = width+size/4;
      direction.set(width/2-location.x, height/2-location.y);
    }
    if (location.y < -size/2) {
      location.y = height+size/4;
      direction.set(width/2-location.x, height/2-location.y);
    }
    if (width+size/2 < location.x) {
      location.x = -size/4;
      direction.set(width/2-location.x, height/2-location.y);
    }
    if (height+size/2 < location.y) {
      location.y = -size/4;
      direction.set(width/2-location.x, height/2-location.y);
    }

    //Shoots
    shotTimer--;
    if (threshold >= shotTimer) {
      objectList.add(new UfoBullet(location.x, location.y));
      shotTimer = 120;
    }
    
     //0. Death Loop
    for (int i = 0; i < objectList.size(); i++) {
      GameObject currentObject = objectList.get(i);
      //1. If object is a bullet
      if (currentObject instanceof Bullet) {
        //2. Ifufo is touching the bullet
        if (dist(location.x, location.y, currentObject.location.x, currentObject.location.y) < size/2 + currentObject.size/2) {
          lives = 0; //Asteroids lives
          currentObject.lives = 0; //Bullets lives
          score+= 10000;
          //3. Particle loop
          for (int j = 0; j <100; j++) {
            objectList.add( new Particle(location.x+random(-size/2, size/2), location.y+random(-size/2, size/2), orange));
          }//3.
        }//2.
      }//1.
    }//0.
  }// -----------------------------------------------------------------------------------------
}
