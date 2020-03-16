void updateTerrain()
{
  int x = -1000;
  float cooldown = 0;
  for (int i = 0; i < boxes.size(); i++)
  {
    //println(i);
    FBox b = boxes.get(i);


    if (b.getName().equals("lava"))
    {
      ((LavaBox) b).animate();
    }

    if (b.getName().equals("player"))
    {
      ((Man) b).animate();
    }



    if ("fall".equals(b.getName())) 
    {
      //print("1");
      b.setStatic(false);
    }

    if ("ice".equals(b.getName()))
    {
      b.setFriction(0.001);
    }

    if ("up".equals(b.getName()))
    {
      b.setStatic(false);
      b.setVelocity(0, -100);
      b.setRotatable(false);
      //box.setRestitution(1);
    }

    if ("push".equals(b.getName()) && b.getX() > 1930)
    {
      b.setStatic(false);
      b.setVelocity(x, 0);
    }

    if (!("moveLeft".equals(b.getName())))
    {
      convey = false;
      
    }

    if ("moveLeft".equals(b.getName()))
    {
      if (convey)
      {
        player.adjustVelocity(10, 0);
      } //else
      //if (convey == false)
      //{
      //player.setVelocity(player.getVelocityX(), 0);
      //}
    }

    if ("activated".equals(b.getName()))
    {
      thwompName = "tFall";
      //println("%");
    }
    //println("!");
    if ("spring".equals(b.getName()))
    {
      b.setRestitution(2*switchState);
    }
    
    if (cooldown <= 0 && portal1 != null)
    {
      if (portal1.isTouchingBody(player))
      {
        wkey = false;
        player.setPosition(x2, y2 + 50);
        cooldown = 100;
      }

      if (portal2.isTouchingBody(player))
      {
        wkey = false;
        player.setPosition(x1, y1 + 50);
        cooldown = 100;
      }
    }
    cooldown--;
  }
}