class Car {
  color c;
  float xpos, ypos, xspeed;
  boolean left;

  Car() {
    c = color (random(255), random(255), random(255));
    xpos = random(width);
    ypos = random(height);
    xspeed = random(1, 5);
    if (int(random(2))==0) {
      left = true;
    } else {
      left = false;
    }
  }

  void display () {
    rectMode (CENTER);
    fill (c);
    rect (xpos, ypos, 20, 10);
    fill (0);
    rect (xpos-10, ypos+7, 6, 4);
    rect (xpos+10, ypos+7, 6, 4);
    rect (xpos-10, ypos-7, 6, 4);
    rect (xpos+10, ypos-7, 6, 4);
    fill (255);
    if (left == true) {
      rect (xpos-2, ypos, 6, 8);
    } else {
      rect (xpos+2, ypos, 6, 8);
    }
    fill (#FFFBD8);
    if (left == true) {
      ellipse (xpos-10, ypos-4, 4, 4);
      ellipse (xpos-10, ypos+4, 4, 4);
    } else {
      ellipse (xpos+10, ypos+4, 4, 4);
      ellipse (xpos+10, ypos-4, 4, 4);
    }
  }

  void drive () {
    if (left ==true) {
      xpos-=xspeed;
    } else {
      xpos+=xspeed;
    }
    if (xpos > width) {
      xpos = 0;
    }
    if (xpos<0) {
      xpos = width;
    }
  }
}
