class Particle extends GameObject {
  //1. Instance Variables
  int age;

  //2. Constructor(s)
  Particle(float _x, float _y) {
    location = new PVector(_x, _y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    velocity.setMag(4);
    size = 4;
    age = 64;
    lives = 2;
  }

  //3. Behavior functions
  void show() {
    noStroke();
    //Age is the alpha value
    fill(grey, age*4);
    ellipse(location.x, location.y, size, size);
  }// -----------------------------------------------------------------------------------------

  void act() {
    super.act();

    //Particles will disappear after a while
    age--;
    if (age == 0) lives = 0;
    
  }// -----------------------------------------------------------------------------------------
}
