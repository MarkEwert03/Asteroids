class UFO extends GameObject {
  //1. Instance Variables
  PVector direction;

  //2. Constructor(s)
  UFO(int _size, float _x, float _y) {
    size = _size;
    lives = 3;
    location  = new PVector(_x, _y);
    direction = new PVector(0, 0);
    velocity  = new PVector(0, 0);
    velocity.setMag(3);
    velocity.rotate( random(TWO_PI) );
  }// -----------------------------------------------------------------------------------------

  //3. Behavior functions
  void show() {
    image(ufoPic, location.x, location.y, size, size);
  }// -----------------------------------------------------------------------------------------

  void act() {
    super.act();
    
    direction.set(myShip.location.x-location.x, myShip.location.y-location.y);
    velocity.add(direction);
    velocity.setMag(2);
  }// -----------------------------------------------------------------------------------------
}
