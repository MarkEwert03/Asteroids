abstract class GameObject {
  //1. Instance Variables
  int lives;
  PVector location, velocity;

  //2. Constructor(s)
  GameObject() {
  }

  //3. Behavior functions
  void show() {
  }// -----------------------------------------------------------------------------------------

  void act() {
    location.add(velocity);

    if (location.x < -SHIPSIZE/2) location.x = width+SHIPSIZE/2;
    if (location.y < -SHIPSIZE/2) location.y = height+SHIPSIZE/2;
    if (width+SHIPSIZE/2 < location.x) location.x = -SHIPSIZE/2;
    if (height+SHIPSIZE/2 < location.y) location.y = -SHIPSIZE/2;
  }// -----------------------------------------------------------------------------------------

  boolean alive() {
    return true;
  }// -----------------------------------------------------------------------------------------
}
