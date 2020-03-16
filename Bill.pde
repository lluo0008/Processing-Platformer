class Bill extends FBox
{
  int costumeNum, direction, speed;

  Bill()
  {
    super(g, g);
    setStaticBody(false);
    setFillColor(black);
    setFriction(0);
    setName("Bill");
    speed = 200;
    direction = 1;
  }


  void animate()
  {
  }


  void move()
  {
    //println("move");
    setVelocity(speed * direction, -15);
    if (touching("wall") || touching("Bill"))
    {
      //println(touching("wall"));
      //direction *= -1;
      setPosition(569, 301);
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
      if (c.contains("Bill", thing))
      {
        return true;
      }
    }

    return false;
  }
}