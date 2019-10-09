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
    image(spaceshipPic, 0, 0);
    popMatrix();
  }// -----------------------------------------------------------------------------------------

  void act() { 
    super.act();
    
    if (upKey) velocity.add(direction);
    if (downKey) velocity.sub(direction);
    if (leftKey) direction.rotate(-radians(2));
    if (rightKey) direction.rotate(radians(2));
    if (spaceKey) objectList.add(new Bullet());
  }// -----------------------------------------------------------------------------------------
}
