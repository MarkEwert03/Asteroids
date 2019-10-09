//Mark Ewert
//Oct 3

//Colours
color red             = #df2020;
color orange          = #df8020;
color yellow          = #dfdf20;
color lime            = #80df20;
color green            = #50df20;
color mint            = #20df50;
color cyan            = #20dfdf;
color blue            = #2080df;
color navy            = #2020df;
color purple          = #8020df;
color violet          = #df20df;
color pink            = #df2080;
color black           = 0;
color grey            = 127;
color white           = 255;

//Game Objects
ArrayList<GameObject> objectList;
final int SHIPSIZE = 50;
final int ASTEROIDSIZE = 100;

//Spaceship
boolean upKey, leftKey, downKey, rightKey, spaceKey;
PImage spaceshipPic;
Ship myShip;

//Asteroid
PImage asteroidPic;

void setup() {
  //Basic
  size(800, 600);

  //Images
  imageMode(CENTER);

  //List
  objectList = new ArrayList<GameObject>();

  //Spaceship
  myShip = new Ship();
  spaceshipPic = loadImage("Ship.png");
  spaceshipPic.resize(SHIPSIZE, SHIPSIZE);
  objectList.add(myShip);

  //Asteroid
  asteroidPic = loadImage("Asteroid.png");
  asteroidPic.resize(ASTEROIDSIZE, ASTEROIDSIZE);
  objectList.add( new Asteroid() );
  objectList.add( new Asteroid() );
  objectList.add( new Asteroid() );
}// -----------------------------------------------------------------------------------------

void draw() {
  background(black);

  //Bullet
  for (int i = 0; i < objectList.size(); i++) {
    GameObject currentObject = objectList.get(i);
    currentObject.show();
    currentObject.act();
  }
}// -----------------------------------------------------------------------------------------

void keyPressed() {
  if (key == 'w' || keyCode == UP)    upKey = true;
  if (key == 'a' || keyCode == LEFT)  leftKey = true;
  if (key == 's' || keyCode == DOWN)  downKey = true;
  if (key == 'd' || keyCode == RIGHT) rightKey = true;
  if (key == ' ')                     spaceKey = true;
}// -----------------------------------------------------------------------------------------

void keyReleased() {
  if (key == 'w' || keyCode == UP)    upKey = false;
  if (key == 'a' || keyCode == LEFT)  leftKey = false;
  if (key == 's' || keyCode == DOWN)  downKey = false;
  if (key == 'd' || keyCode == RIGHT) rightKey = false;
  if (key == ' ')                     spaceKey = false;
}// -----------------------------------------------------------------------------------------
