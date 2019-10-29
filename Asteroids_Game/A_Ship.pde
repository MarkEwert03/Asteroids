class Ship extends GameObject {
  //1. Instance Variables
  PVector direction;
  int shotTimer, threshold;

  //Forcefield
  int d, aTimer;
  boolean invinsible;

  //2. Constructor(s)
  Ship() {
    location  = new PVector(width/2, height/2);
    velocity  = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    shotTimer = 15;
    threshold = 0;
    size = 50;
    lives = 2;
    score = 0;

    //Forcefield
    aTimer = 225;
    invinsible = false;
  }

  //3. Behavior functions
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    image(spaceshipPic, 0, 0, size, size);
    popMatrix();

    //Forefield
    if (invinsible == true) {
      aTimer--;
      stroke(white, aTimer);
      strokeWeight(5);
      noFill();
      ellipse(location.x, location.y, size*1.5, size*1.5);
    }

    //aTimer reset
    if (aTimer <= 0) {
      aTimer = 255;
      invinsible = false;
    }
  }// -----------------------------------------------------------------------------------------

  void act() { 
    super.act();

    //Moves
    if (upKey) velocity.add(direction);
    if (downKey) velocity.sub(direction);
    if (leftKey) direction.rotate(-radians(2));
    if (rightKey) direction.rotate(radians(2));

    //Shoots
    shotTimer--;
    if (spaceKey && threshold >= shotTimer) {
      objectList.add(new Bullet());
      shotTimer = 15;
    }

    //Touching asteroid?
    if (invinsible == false) {
      //0. Loop
      for (int i = 0; i<objectList.size(); i++) {
        GameObject currentObject = objectList.get(i);
        //1. 
        if (currentObject instanceof Asteroid) {
          //2. If touching ship
          if (dist(currentObject.location.x, currentObject.location.y, location.x, location.y) < currentObject.size/2 + size/2) {
            invinsible = true;
            lives--;
          }//2.
        }//1.
      }//0.
    }
  }// -----------------------------------------------------------------------------------------
}// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
