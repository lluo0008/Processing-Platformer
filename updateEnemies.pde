void updateEnemies()
{
  float vx = 0;
  boolean touchingWater = false;
  ArrayList<FContact> contacts = player.getContacts();

  //for (int i = 0; i < enemies.size(); i++)
  //{
  //  FContact c = contacts.get(i);
  //  FBox enemy = enemies.get(i);

  //  if (enemy.getName().equals("Goomba"))
  //  {
  //    ((Goomba) enemy ).move();
  //  }

  //  if (c.contains("Goomba", "ground") || c.contains("Goomba", "water surface"))
  //  {
  //    touchingWater = true;
  //  }
  //}

  for (FBox enemy : enemies)
  {
    String name = enemy.getName();
    if (name.equals("Goomba"))
    {
      ((Goomba) enemy ).move();
    }

    if (name.equals("Thwomp"))
    {
      //println("*");
      //enemy.setStaticBody(false);
      ((Thwomp) enemy ).move();
    }

    if (name.equals("Suprise") && switchState == 1) 
    {
      //println("wtf");
      enemy.setStatic(false);
      ((Suprise) enemy).move();
    }

    if (name.equals("Bill") && switchState == 1) 
    {
      enemy.setStatic(false);
      ((Bill) enemy).move();
    }
  }
}