class Bullet extends GameObject {
  //1. Instance Variables
  int s;

  //2. Constructor(s)
  Bullet() {
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(.5);
    s = 10;
  }

  //3. Behavior functions
  void show() {
    noStroke();
    fill(blue);
    ellipse(location.x, location.y, s, s);
  }// -----------------------------------------------------------------------------------------

  void act() {
    location.add(velocity);
  }// -----------------------------------------------------------------------------------------
}
