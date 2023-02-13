class Laser {
  int x, y,w,h, speed;

  //constructor
  Laser (int x, int y) {
    this.x = x;
    this.y = y;
    w= 4;
    h = 10;
    speed = 10;
  }

  void display () {
    noStroke ();
    fill (#A13CC6);
    rect (x,y,w,h);
  }

  void move () {
    y -= speed;
  }

  boolean reachedTop () {
    if (y<-50) {
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
