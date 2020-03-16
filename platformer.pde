import fisica.*;

color ground = #A3E39B;
color lightGrey = #DCDCDC;
color grey = #626262;
color button = #8B8888;
color black = #000000;
color wood = #EFE4B0;
color iceyBlue = #99D9EA;
color red = #ED1C24;
color water = #3F48CC;
color belt = #880015;
color yellow = #FFF200;
color pink = #FFAEC9;
color orange = #FF7F27;
color purple = #A349A4;
color sign1 = #22B14C;
color lava = #FFC90E;
color LAVA = #FFC80E;
color Goomba = #C8BFE7;
color Thwomp = #00FF80;
color spike = #00FFFF;
color supriseG = #408080;
color launcherColour = #FF00FF;
color billColour = #8080FF;

FWorld world;
FCircle ball;
FCircle bomb;
FCircle bomb1;
FBox player;
FBox box;
FBox spring;
FBox portal1;
FBox portal2;
//FBox button;
//FBlob player;
FPoly floor;

int x = 0;
int y = 0;
float x1 = 0;
float y1 = 0;
float x2 = 0;
float y2 = 0;
int g = 40;
int cooldown = 0;
int cooldown1 = 0;
int gridSize;
int zoom;
int dir = 1;

String thwompName = "Thwomp";

//Keyboard
boolean wkey, skey, akey, dkey, up, down, left, right, space, shift, e, q;
boolean convey = false;

//Switch
boolean switchActive = true;
int switchState = -1;

//Animated terrain
PImage[] swirls = new PImage [4];
PImage[] lavapics = new PImage [6];
PImage[] man = new PImage [8];
PImage[] idle = new PImage [13];
PImage[] fly = new PImage [4];
PImage[] currentAction;
int costumeNum = 0;

float topSpeed = 500;

ArrayList <FBox> boxes;
ArrayList <FBox> enemies;

PImage map;
PImage map1;
PImage map2;
PImage triangle;
PImage suprise;
PImage launcher;
PImage bulletBill;
PImage gooomba;
void setup()
{
  fullScreen(FX2D);
  Fisica.init(this);
  
  gooomba = loadImage("gooomba.png");
  gooomba.resize(g * 2, g*2);
  
  triangle = loadImage("triangle.png");
  triangle.resize(g, g);
  
  suprise = loadImage("suprise.jpg");
  suprise.resize(g + 5, g + 5);
  
  launcher = loadImage("launcher.jpg");
  launcher.resize(g * 2, g * 2);
  
  bulletBill = loadImage("bulletBill.png");
  bulletBill.resize(g * 2, g * 2);
  
  for (int i = 0; i < lavapics.length; i++)
  {
    lavapics[i] = loadImage("lava" + i + ".png");
    lavapics[i].resize(g, g);
  }
  
  for (int i = 0; i < man.length; i++)
  {
    man[i] = loadImage("man" + i + ".png");
    man[i].resize(g, g);
  }
  
  for (int i = 0; i < idle.length; i++)
  {
    idle[i] = loadImage("idle" + i + ".png");
    idle[i].resize(g, g);
  }
  
  for (int i = 0; i < fly.length; i++)
  {
    fly[i] = loadImage("fly" + i + ".png");
    fly[i].resize(g * 2, g* 2);
  }
  
  currentAction = idle; // idle is name of array of costumes.
  
  gridSize = 3;
  zoom = 5;
  loadWorld("map1.png");
  
}
void draw()
{
  background (255);
  
  pushMatrix();
  translate(-player.getX() + width/2, -player.getY()+ height/2);
  world.step();
  world.draw();
  popMatrix();
  
  print("yes1");
 
  
  updatePlayer();
  //print("yes2");
  updateTerrain();
  //print("yes3");
  updateEnemies();
  //print("yes4");
}

void contactStarted(FContact contact)
{
  FBody body1 = contact.getBody1();
  FBody body2 = contact.getBody2();
  FBody other;

  if (body1 == player) {
    other = body2;
  } else {
    other = body1;
  }

  if (contact.contains("player", "door1"))
  {
    loadWorld("map1.png");
  }

  if (contact.contains("player", "bridge")) //falling bridge
  { 
    other.setName("fall");
    //println("!?!?!");
  }

  if (contact.contains("player", "button") && switchActive)
  {
    switchState = switchState * -1;
    switchActive = false;

    if (switchState == -1)
    {
      other.setFillColor(lightGrey);
      
    } else
    {
      other.setFillColor(grey);
    }
    

    //make the switch mean something by looping through your terrain list and affecting the appropriate FBoxes.
  }

  if (contact.contains("player", "ice"))
  {
    other.setName("slide");
  }

  if (contact.contains("player", "lift"))
  {
    other.setName("up");
  }

  if (contact.contains("player", "belt"))
  {
    other.setName("moveLeft");
    convey = true;
  }

  if (contact.contains("player", "piston"))
  {
    other.setName("push");
  }

  if (contact.contains("player", "teleport"))
  {
    wkey = false;
    other.setName("blink");
  }

  if (contact.contains("player", "teleport2"))
  {
    wkey = false;
    other.setName("blink2");
  }
  
  if (contact.contains("player", "trigger"))
  {
    other.setName("activated");
    //println("^");
  }
}


void contactEnded (FContact contact)
{
  if (contact.contains("player", "button"))
  {
    switchActive = true;
  }
}


void contactPersisted(FContact contact)
{
  if (contact.contains("player", "sign1"))
  {
    fill(0);
    rect(player.getX() - 500, player.getY() - 400, 1000, 200);
    textSize(100);
    fill(255);
    text("<- ELEVATOR", player.getX() - 290, player.getY() - 270);
  }
}

void keyPressed()
{
  if (key == 'w' || key == 'W') wkey = true;
  // if (player.getY() >= 720 && (keyCode == SHIFT) ) player.setVelocity(player.getVelocityX(), -1400);
  if (key == 's' || key == 'S') skey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (key == 'e' || key == 'E') e = true;
  if (key == 'q' || key == 'Q') q = true;
  if (key == ' ') space = true;
  if (keyCode == SHIFT) shift = true;
}

void keyReleased()
{
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (key == 'e' || key == 'E') e = false;
  if (key == 'q' || key == 'Q') q = false;
  if (keyCode == UP) up = false;
  if (keyCode == DOWN) down = false;
  if (keyCode == LEFT) left = false;
  if (keyCode == RIGHT) right = false;
  if (key == ' ') space = false;
  if (keyCode == SHIFT) shift = false;
}