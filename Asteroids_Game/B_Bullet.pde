class Bullet extends GameObject {
  //1. Instance Variables
  int s, age;

  //2. Constructor(s)
  Bullet() {
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(8);
    s = 5;
    age = 120;
  }

  //3. Behavior functions
  void show() {
    noStroke();
    fill(blue);
    ellipse(location.x, location.y, s, s);
  }// -----------------------------------------------------------------------------------------

  void act() {
    super.act();
    
    age--;
    if(age == 0);{
      age = 120;
    }
  }// -----------------------------------------------------------------------------------------
}
