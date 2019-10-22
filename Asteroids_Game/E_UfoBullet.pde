class UfoBullet extends GameObject {
  //1. Instance Variables
  int age;

  //2. Constructor(s)
  UfoBullet() {
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(8);
    size = 10;
    age = 60;
    lives = 2;
  }

  //3. Behavior functions
  void show() {
    noStroke();
    fill(pink);
    ellipse(location.x, location.y, size, size);
  }// -----------------------------------------------------------------------------------------

  void act() {
    super.act();

    //Bullets will disappear after a while
    age--;
    if (age == 0) lives = 0;
  }// -----------------------------------------------------------------------------------------
}
