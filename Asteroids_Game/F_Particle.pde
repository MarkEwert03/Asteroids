class Particle extends GameObject {
  //1. Instance Variables
  int age;
  color c;

  //2. Constructor(s)
  Particle(float _x, float _y, color _c) {
    location = new PVector(_x, _y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    velocity.setMag(4);
    size = 4;
    age = 64;
    lives = 2;
    c = _c;
  }

  //3. Behavior functions
  void show() {
    noStroke();
    //Age is the alpha value
    fill(c, age*4);
    ellipse(location.x, location.y, size, size);
  }// -----------------------------------------------------------------------------------------

  void act() {
    super.act();

    //Particles will disappear after a while
    age--;
    if (age == 0) lives = 0;
    
  }// -----------------------------------------------------------------------------------------
}
