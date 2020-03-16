//class ManRight extends FBox
//{
//  int costumeNum;
//  int delay;


//  ManRight()
//  {
//    super(g, g);
//    costumeNum = 0;
//    delay = (int) random(0, 500);
//    setStaticBody (true);
//    attachImage(manRight[0]);
//    setName("man");
//  }

//  void animate()
//  {
//    delay--;
//    if (delay < 0)
//    {
//      if (frameCount % 5 == 0)
//      {
//        attachImage(manRight[costumeNum]);
//        costumeNum++;
//        if (costumeNum == 4)
//        {
//          costumeNum = 0;
//          attachImage(manRight[0]);
//          delay = 500;
//        }
//      }
//    }
//  }
//}