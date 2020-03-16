//THIS IS MY OWN ATTEMPT AT MAKING CHARACTER ANIMATIONS 
//BEFORE YOU EXPLAINED IT IN CLASS, WHICH DOES NOT WORK.

class Man extends FBox
{
  int costumeNum;
  int delay;


  Man()
  {
    super(g, g);
    costumeNum = 0;
    delay = (int) random(0, 500);
    setStaticBody (true);
    attachImage(man[0]);
    setName("man");
  }

  void animate()
  {
    if (dkey)
    {
      delay--;
      if (delay < 0)
      {
        if (frameCount % 5 == 0)
        {
          attachImage(man[costumeNum]);
          costumeNum++;
          if (costumeNum == 4)
          {
            costumeNum = 0;
            attachImage(man[0]);
            delay = 500;
          }
        }
      }
    }

    if (akey)
    {
      delay--;
      if (delay < 0)
      {
        if (frameCount % 5 == 0)
        {
          attachImage(man[costumeNum]);
          costumeNum++;
          if (costumeNum == 8)
          {
            costumeNum = 0;
            attachImage(man[4]);
            delay = 500;
          }
        }
      }
    }
  }
}