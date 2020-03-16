class Suprise extends FBox
{
  int costumeNum, direction, speed;

  Suprise()
  {
    super(g, g);
    setStaticBody(false);
    setFillColor(supriseG);
    setFriction(0);
    setName("Suprise");
    speed = 50;
    direction = 1;
  }


  void animate()
  {
  }


  void move()
  {
    //println("move");
    setVelocity(speed * direction, getVelocityY());
    if (touching("wall") || touching("Suprise"))
    {
      //println(touching("wall"));
      direction *= -1;
      setPosition(getX() + (direction * 5), getY());
    }
    
    if (touching("player"))
    {
      setName("dead");
      //world.remove(this);
    }
  }



  boolean touching(String thing)
  {
    ArrayList<FContact> contacts = getContacts();

    for (int i = 0; i < contacts.size(); i++)
    {
      FContact c = contacts.get(i);
      if (c.contains("Suprise", thing))
      {
        return true;
      }
    }

    return false;
  }
}