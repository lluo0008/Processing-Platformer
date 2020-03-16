class Thwomp extends FBox
{
  int costumeNum, direction, speed;

  Thwomp()
  {
    super(g * 3, g * 3);
    setStatic(true);
    setFillColor(0);
    setFriction(0);
    setName("Thwomp");
    speed = 50;
    direction = 1;
  }


  void animate()
  {
  }


  void move()
  {
    if (dist(player.getX(), player.getY(), getX(), getY()) <= 280)
    {
      setStatic(false);
      adjustVelocity(0, 1);
    }
  }
}