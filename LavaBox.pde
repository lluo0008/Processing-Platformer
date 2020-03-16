class LavaBox extends FBox
{
  int costumeNum;
  int delay;


  LavaBox()
  {
    super(g, g);
    costumeNum = 0;
    delay = (int) random(0, 500);
    setStaticBody (true);
    attachImage(lavapics[0]);
    setName("lava");
  }

  void animate()
  {
    delay--;
    if (delay < 0)
    {
      if (frameCount % 5 == 0)
      {
        attachImage(lavapics[costumeNum]);
        costumeNum++;
        if (costumeNum == 6)
        {
          costumeNum = 0;
          attachImage(lavapics[0]);
          delay = 500;
        }
      }
    }
  }
}