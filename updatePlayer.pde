void updatePlayer()
{  
  float vx = 0;
  boolean touchingWater = false;
  ArrayList<FContact> contacts = player.getContacts();


  if (frameCount % 10 == 0)
  {
    if (costumeNum >= currentAction.length)
    {
      costumeNum = 0;
    }
    if (dir == 1)
    {
      player.attachImage(currentAction[costumeNum]);
    }
    else player.attachImage( reverseImage(currentAction[costumeNum]) );
    costumeNum++;
  }


  for (int i = 0; i < contacts.size(); i++)
  {
    FContact c = contacts.get(i);
    if (c.contains("player", "water") || c.contains("player", "water surface"))
    {
      touchingWater = true;
    }

    if (c.contains("player", "Thwomp"))
    {
      gameOver();
      world.remove(player);
    }

    if (c.contains("player", "Spike"))
    {
      gameOver();
      world.remove(player);
    }

    //if (c.contains("player", "teleport"))
    //{
    //  player.setPosition(958, 453);
    //}
  }

  if (touchingWater)
  {
  }
  
  
  if (player.getX() >= 5000)
  {
    loadWorld("map2.png");
  }

if (wkey)
    {
      if (touchingWater)
      {
        player.setVelocity(player.getVelocityX(), -500);
      } else 
      player.setVelocity(player.getVelocityX(), -500);
    }
  if (contacts.size() > 0)
  {
    
  }
  
  if (!akey && !dkey && contacts.size() > 0)
  {
    currentAction = idle;
  }
  else if (!akey && !dkey && contacts.size() == 0)
  {
    currentAction = fly;
  }

  if (akey) 
  {
    dir = 0;
    vx = -topSpeed;
    player.setFill(220);
    currentAction = fly;
    if (touchingWater == true)
    {
      vx = -topSpeed/2;
    } else touchingWater = false;
  }

  if (dkey) 
  {
    dir = 1;
    vx = topSpeed;
    player.setFill(98);
    currentAction = fly;
    //if (player.getVelocityX() == 0)
    //{
    //  currentAction = idle;
    //}

    //else currentAction = jump;


    if (touchingWater == true)
    {
      vx = topSpeed/2;
    } else touchingWater = false;
  }
  player.setVelocity(vx, player.getVelocityY() + 10);
}