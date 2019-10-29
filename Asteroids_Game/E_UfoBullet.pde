class UfoBullet extends GameObject {
  //1. Instance Variables
  int age;

  //2. Constructor(s)
  UfoBullet(float _x, float _y) {
    location = new PVector(_x, _y);
    velocity = new PVector(myShip.location.x - _x, myShip.location.y - _y);
    velocity.setMag(5);
    size = 10;
    age = 120;
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

    if (dist(location.x, location.y, myShip.location.x, myShip.location.y) < size/2 + myShip.size/2) {
      if (myShip.invinsible == false) {
        lives = 0;
        myShip.lives--;
        myShip.invinsible = true;
      }
    }
  }// -----------------------------------------------------------------------------------------
}
