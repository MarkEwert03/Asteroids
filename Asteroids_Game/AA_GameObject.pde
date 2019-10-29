abstract class GameObject {
  //1. Instance Variables
  int lives, size;
  PVector location, velocity;

  //2. Constructor(s)
  GameObject() {
  }

  //3. Behavior functions
  void show() {
  }// -----------------------------------------------------------------------------------------

  void act() {
    location.add(velocity);
    
    if (location.x < -size/2)       location.x = width+size/2;
    if (location.y < -size/2)       location.y = height+size/2;
    if (width+size/2 < location.x)  location.x = -size/2;
    if (height+size/2 < location.y) location.y = -size/2;
  }// -----------------------------------------------------------------------------------------
}// ----------------------------------------------------------------------------------------------------------------------------------------------------------------------
