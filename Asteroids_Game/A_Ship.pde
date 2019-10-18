class Ship extends GameObject {
  //1. Instance Variables
  PVector direction;
  int shotTimer, threshold, score;

  //2. Constructor(s)
  Ship() {
    location  = new PVector(width/2, height/2);
    velocity  = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    shotTimer = 0;
    threshold = 10;
    size = 50;
    lives = 4;
    score = 0;
  }

  //3. Behavior functions
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    image(spaceshipPic, 0, 0, size, size);
    popMatrix();
  }// -----------------------------------------------------------------------------------------

  void act() { 
    super.act();
    shotTimer++;

    if (upKey) velocity.add(direction);
    if (downKey) velocity.sub(direction);
    if (leftKey) direction.rotate(-radians(2));
    if (rightKey) direction.rotate(radians(2));
    if (spaceKey && threshold <= shotTimer) {
      objectList.add(new Bullet());
      shotTimer = 0;
    }

    //0. Loop
    for (int i = 0; i<objectList.size(); i++) {
      GameObject currentObject = objectList.get(i);
      //1. 
      if (currentObject instanceof Asteroid) {
        //2. If touching ship
        if (dist(currentObject.location.x, currentObject.location.y, location.x, location.y) < currentObject.size/2 + size/2) {
          lives--;
          currentObject.lives = 0;
        }//2.
      }//1.
    }//0.
  }// -----------------------------------------------------------------------------------------
}// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
