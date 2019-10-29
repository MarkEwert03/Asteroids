//Mark Ewert
//Oct 3

//Mode Framework
int mode;
final int INTRO = 0;
final int GAME  = 1;
final int PAUSE = 2;
final int LOSE  = 3;
final int WIN   = 4;

//Colours
color red             = #df2020;
color orange          = #df8020;
color yellow          = #dfdf20;
color lime            = #80df20;
color green           = #50df20;
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

//Spaceship
boolean upKey, leftKey, downKey, rightKey, spaceKey;
PImage spaceshipPic;
Ship myShip;

//Asteroid
PImage asteroidPic;
int asteroidTimer = 180;

//UFO
PImage ufoPic;
int ufoTimer = 900;

//Other
int score, highScore, highScoreColor, livesColor;
PFont font;
PImage introPic, winPic, losePic;

// ------------------------------------------------------------------------------------------
void setup() {
  //Basic
  size(800, 600);
  mode = INTRO;

  //Images
  imageMode(CENTER);
  introPic = loadImage("Nebula.jpg");
  losePic  = loadImage("Lose.jpg");
  winPic   = loadImage("Win.jpg");

  //Text
  textAlign(CENTER, CENTER);
  font = createFont("Rock Font.ttf", 120);
  textFont(font);

  //List
  objectList = new ArrayList<GameObject>();

  //Spaceship
  myShip = new Ship();
  spaceshipPic = loadImage("Ship.png");
  objectList.add(myShip);
  
  //Asteroid
  asteroidPic = loadImage("Asteroid.png");
  
  //UFO
  ufoPic = loadImage("UFO.png");
  
  //Other
  highScoreColor = 255;
  livesColor = 255;
  
}// -----------------------------------------------------------------------------------------

void draw() {
  //Mode Framework
  if      (mode == INTRO) intro();
  else if (mode == GAME)  game();
  else if (mode == PAUSE) pause();
  else if (mode == LOSE)  lose();
  else if (mode == WIN)   win();
  else println("Error! Mode was " + mode);
}// -----------------------------------------------------------------------------------------

void mousePressed() {
  if      (mode == INTRO) introMousedPressed();
  else if (mode == GAME)  gameMousedPressed();
  else if (mode == PAUSE) pauseMousedPressed();
  else if (mode == LOSE)  loseMousedPressed();
  else if (mode == WIN)   winMousedPressed();
  else println("Error! Mode was " + mode);
}

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
