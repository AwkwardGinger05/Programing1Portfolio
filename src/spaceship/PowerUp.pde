class PowerUp {
  int x, y, speed, diam;
  char type;

  //constructor
  PowerUp () {
    x = int (random(width));
    y = -10;
    speed = int (random (2, 4));
    diam = 50;
    if (int(random(2))==0) {
      type = 'H';
    } else {
      type = 'A';
    }
  }

  void display () {
    fill (0, 222, 0);
    ellipse (x, y, diam, diam);
    fill (222);
    text (type, x, y);
  }

  void move () {
    y += speed;
  }

  boolean reachedBottom () {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }


  boolean intersect (Ship ship) {
    float d = dist (x, y, ship.x, ship.y);
    if (d<30) {
      return true;
    } else {
      return false;
    }
  }
}
