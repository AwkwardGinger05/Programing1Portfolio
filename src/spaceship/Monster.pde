class Monster {
  int x, y, speed, diam;
  PImage monster;

  //constructor
  Monster () {
    x = int (random(width));
    y = 10;
    speed = int (random (2, 5));
    diam = 50;
    monster = loadImage ("jelly.png");
    monster.resize (75, 75);
  }

  void display () {
    image (monster, x, y);
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
}
