class Ship extends GameObject {
  //1. Instance Variables
  PVector direction;

  //2. Constructor(s)
  Ship() {
    location  = new PVector(width/2, height/2);
    velocity  = new PVector(0, 0);
    direction = new PVector(0, -0.1);
  }

  //3. Behavior functions
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    image(spaceship, 0, 0);
    popMatrix();
  }// -----------------------------------------------------------------------------------------

  void act() {
    location.add(velocity);
    
    if (upKey) velocity.add(direction);
    if (downKey) velocity.sub(direction);
    if (leftKey) direction.rotate(-radians(2));
    if (rightKey) direction.rotate(radians(2));
    if (spaceKey) myGameObjects.add(new Bullet());
    
    if (location.x < -25) location.x = width+25;
    if (location.y < -25) location.y = height+25;
    if (width+25 < location.x) location.x = -25;
    if (height+25 < location.y) location.y = -25;
  }// -----------------------------------------------------------------------------------------
}
