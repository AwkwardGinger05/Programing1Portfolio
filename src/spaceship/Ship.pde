class Ship {
  int x, y, w, ammo, turretCount, health;
  PImage ship;

  Ship () {
    x=0;
    y = 0;
    w = 100;
    ammo = 200;
    turretCount = 2;
    health = 100;
    ship = loadImage ("big_ship.png");
  }

  void display (int tempx, int tempy) {
    x = tempx;
    y = tempy;
    imageMode (CENTER);
    image (ship, x, y);
  }

  boolean fire () {
    if (ammo>0) {
      ammo --;
      return true;
    } else {
      return false;
    }
  }

  boolean intersect (Monster monster) {
    float d = dist (x, y, monster.x, monster.y);
    if (d<40) {
      return true;
    } else {
      return false;
    }
  }
}
