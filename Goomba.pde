class Goomba extends FBox
{
  int costumeNum, direction, speed;

  Goomba()
  {
    super(g, g);
    setStaticBody(false);
    setFillColor(Goomba);
    setFriction(0);
    setName("Goomba");
    speed = 50;
    direction = 1;
  }


  void animate()
  {
  }


  void move()
  {
    setVelocity(speed * direction, getVelocityY());
    if (touching("wall") || touching("Goomba"))
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
      if (c.contains("Goomba", thing))
      {
        return true;
      }
    }

    return false;
  }
}