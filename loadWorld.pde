void loadWorld(String mapname)
{
  world = new FWorld(-1000000, -1000000, 1000000, 1000000);
  world.setGravity(0, 800);


  boxes = new ArrayList <FBox> ();
  enemies = new ArrayList <FBox> ();
  
  map = loadImage(mapname);
  int x = 0;
  int y = 0;
  
  
  
  
  while (y < map.height)
  {
    color c = map.get(x, y);
    if (c == ground)
    {
      FBox b = new FBox(g, g);
      b.setFill(ground);
      b.setPosition(x * g, y * g);
      b.setStatic (true);
      b.setName("ground");
      world.add(b);
      boxes.add(b);
    }


    if (c == lava)
    {
      LavaBox lb = new LavaBox();
      lb.setPosition(x * g, y * g);
      lb.setStrokeColor(lava);
      lb.setFill(255, 201, 14);
      world.add(lb);
      boxes.add(lb);
    }

    if (c == LAVA)
    {
      FBox box = new FBox(g, g);
      box.setPosition(x * g, y * g);
      box.setStrokeColor(#750000);
      box.setName("LAVA");
      box.setFill(117, 0, 0);
      box.setStatic(true);
      world.add(box);
      boxes.add(box);
    }

    if (c == black)
    {
      player = new Man();
      //println("PLAYA");
      //player = new FBlob();

      //player.setAsCircle(400);
      //println("?");
      player.setStroke(0);
      player.setFill(0);
      player.setName("player");
      player.setNoStroke();

      player.setStatic(false);
      player.setDensity(0.2);
      player.setFriction(0.001);
      player.setRestitution(0.3);
      player.setRotatable(false);

      player.setPosition(x * g, y * g);
      world.add(player);
    }

    if (c == grey)
    {
      FBox box = new FBox(g, g);
      box.setName("bridge");
      box.setStrokeColor(grey);
      box.setFill(98);
      //box.setFill(brown);
      box.setPosition( x * g, y * g);
      box.setStatic(true);
      world.add(box);
      boxes.add(box);
    }

    if (c == lightGrey)
    {
      FBox box = new FBox(g, g);
      box.setName("wall");
      box.setStrokeColor(lightGrey);
      box.setFill(220, 220, 220);
      //box.setFill(brown);
      box.setPosition( x * g, y * g);
      box.setStatic(true);
      world.add(box);
      //println("i made a wall -- Trump");
    }

    if (c == button)
    {
      FBox box = new FBox(g, g);
      box.setName("button");
      box.setStrokeColor(button);
      box.setFill(139, 136, 136);
      box.setPosition( x * g, y * g);
      box.setStatic(true);
      box.setSensor(true);
      world.add(box);
    }

    if (c == wood)
    {
      FBox box = new FBox(g * 2, g * 2);
      box.setName("box");
      box.setStrokeColor(wood);
      box.setFill(239, 228, 176);
      box.setPosition( x * g, y * g);
      box.setStatic(false);
      box.setFriction(2);
      world.add(box);
    }

    if (c == iceyBlue)
    {
      FBox box = new FBox(g, g);
      box.setName("ice");
      box.setStrokeColor(iceyBlue);
      box.setFill(153, 217, 234);
      box.setPosition( x * g, y * g);
      box.setStatic(true);
      box.setFriction(0.0001);
      world.add(box);
      //boxes.add(box);
    }

    if (c == red)
    {
      FBox box = new FBox(g * 3, g);
      box.setName("lift");
      box.setRotatable(false);
      box.setStrokeColor(red);
      box.setFill(237, 28, 36);
      //box.setFill(brown);
      box.setPosition( x * g, y * g);
      box.setStatic(true);
      //box.setRestitution(2);
      world.add(box);
      boxes.add(box);
    }

    if (c == yellow)
    {
      spring = new FBox(g, g);
      spring.setName("spring");
      spring.setStrokeColor(yellow);
      spring.setFill(255, 242, 0);
      spring.setPosition( x * g, y * g);
      spring.setStatic(true);
      //box.setRestitution(2);
      world.add(spring);
      boxes.add(spring);
    }

    if (c == water)
    {
      FBox box = new FBox(g, g);
      box.setName("water");
      box.setStrokeColor(water);
      box.setFill(63, 72, 204, 150);
      //box.setFill(brown);
      box.setPosition( x * g, y * g);
      box.setSensor(true);
      box.setStatic(true);
      box.setFriction(5);
      world.add(box);
      boxes.add(box);
    }

    if (c == belt)
    {
      FBox box = new FBox(g, g);
      box.setName("belt");
      box.setStrokeColor(belt);
      box.setFill(136, 0, 21);
      box.setPosition( x * g, y * g);
      box.setStatic(true);
      box.setFriction(5);
      world.add(box);
      boxes.add(box);
    }

    if (c == pink)
    {
      FBox box = new FBox(g, g * 5);
      box.setName("piston");
      box.setStrokeWeight(3);
      box.setStrokeColor(red);
      box.setFill(0);
      box.setPosition( x * g, y * g);
      box.setStatic(true);
      box.setRotatable(false);
      world.add(box);
      boxes.add(box);
    }

    if (c == orange)
    {
      portal1 = new FBox(g * 10, g * 2);
      portal1.setName("teleport");
      portal1.setStrokeWeight(3);
      portal1.setStrokeColor(0);
      portal1.setFill(255, 127, 39);
      portal1.setPosition( x * g, y * g);
      portal1.setStatic(true);
      portal1.setRotatable(false);
      x1 = portal1.getX();
      y1 = portal1.getY();
      world.add(portal1);
      boxes.add(portal1);
    }

    if (c == purple)
    {
      portal2 = new FBox(g * 10, g * 2);
      portal2.setName("teleport2");
      portal2.setStrokeWeight(3);
      portal2.setStrokeColor(0);
      portal2.setFill(163, 73, 164);
      portal2.setPosition( x * g, y * g);
      portal2.setStatic(true);
      portal2.setRotatable(false);
      x2 = portal2.getX();
      y2 = portal2.getY();
      world.add(portal2);
      boxes.add(portal2);
    }

    if (c == sign1)
    {
      FBox box = new FBox(g * 2, g * 2);
      box.setName("sign1");
      box.setSensor(true);
      box.setStrokeWeight(3);
      box.setStrokeColor(red);
      box.setFill(34, 177, 76);
      box.setPosition( x * g, y * g);
      box.setStatic(true);
      box.setRotatable(false);
      world.add(box);
      boxes.add(box);
    }
    
    if (c == Goomba)
    {
      Goomba goomba = new Goomba();
      goomba.setPosition(x * g, y * g);
      goomba.setName("Goomba");
      goomba.setStrokeColor(Goomba);
      goomba.setFill(200, 191, 231);
      goomba.attachImage(gooomba);
      world.add(goomba);
      boxes.add(goomba);
      enemies.add(goomba);
    }
    
    if (c == Thwomp)
    {
      Thwomp t = new Thwomp();
      t.setPosition(x * g, y * g);
      t.setStrokeWeight(12);
      t.setStrokeColor(red);
      t.setFill(0);
      world.add(t);
      boxes.add(t);
      enemies.add(t);
    }
    
    if (c == spike)
    {
      FBox box = new FBox(g, g);
      box.setName("Spike");
      box.setFill(0);
      box.attachImage(triangle);
      box.setPosition( x * g, y * g);
      box.setStatic(true);
      box.setRotatable(false);
      world.add(box);
      boxes.add(box);
    }
    
    if (c == supriseG)
    {
      Suprise s = new Suprise();
      s.setName("Suprise");
      s.setFill(0);
      s.attachImage(suprise);
      s.setPosition( x * g, y * g);
      s.setStatic(true);
      s.setRotatable(false);
      world.add(s);
      enemies.add(s);
    }
    
    if (c == launcherColour)
    {
      FBox box = new FBox(g, g);
      box.setName("launcher");
      box.setFill(0);
      box.attachImage(launcher);
      box.setPosition( x * g, y * g);
      box.setStatic(true);
      box.setRotatable(false);
      world.add(box);
      boxes.add(box);
    }
    
    if (c == billColour)
    {
      Bill s = new Bill();
      s.setName("Bill");
      s.setFill(0);
      s.attachImage(bulletBill);
      s.setPosition( x * g, y * g - 10);
      s.setStatic(true);
      s.setRotatable(false);
      world.add(s);
      enemies.add(s);
    }

    x++;

    if (x > map.width)
    {
      x = 0;
      y++;
    }
  }
}