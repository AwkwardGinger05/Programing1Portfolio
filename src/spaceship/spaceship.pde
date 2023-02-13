// Pax Ferguson || 11/28/22 || Space Game
import processing.sound.*;
SoundFile file;
Ship s1;
Timer rockTimer, puTimer;
ArrayList<Monster> monsters = new ArrayList<Monster>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Star [] stars = new Star [200];
int score, level, monsterPass;
boolean play;

void setup () {
  size (500, 500);
  s1 = new Ship ();
  rockTimer = new Timer (500);
  rockTimer.start();
  puTimer = new Timer (800);
  puTimer.start ();
  for (int i = 0; i<stars.length; i ++) {
    stars [i] = new Star ();
  }
  score = 0;
  level = 1;
  monsterPass = 0;
  play = false;
}

void draw () {
  if (!play) {
    startScreen ();
  } else {
    background (0);

    //stars
    for (int i =0; i<stars.length; i ++) {
      stars [i].display();
      stars [i].move ();
    }
    noCursor();
    //add monster
    if (rockTimer.isFinished()) {
      monsters.add(new Monster());
      rockTimer.start();
      println ("Monsters:" + monsters.size ());
    }
    //add power up
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
      println ("PowerUp:" + powerups.size ());
    }

    //render powerups and detecting collision
    for (int i = 0; i < powerups.size(); i++) {
      PowerUp pu = powerups.get(i);
      if (pu.intersect(s1)) {
        if (pu.type == 'H') {
          s1.health+=100;
        } else{
          s1.ammo += 100;
        }
         powerups.remove(pu);
      }
      
      if (pu.reachedBottom()) {
        powerups.remove(pu);
      } else {
        pu.display();
        pu.move ();
      }
    }

    //render monsters and detecting collision
    for (int i = 0; i < monsters.size(); i++) {
      Monster r = monsters.get(i);
      if (s1.intersect(r)) {
        s1.health -=20;
        monsterPass ++;
        monsters.remove(r);
        score-=100;
      }
      if (r.reachedBottom()) {
        monsters.remove(r);
      } else {
        r.display();
        r.move ();
      }
    }
    //lasers and lasers detection
    for (int i = 0; i < lasers.size(); i ++) {
      Laser l = lasers.get(i);
      for (int j = 0; j < monsters.size(); j++) {
        Monster r = monsters.get(j);
        if (l.intersect(r)) {
          score+=50;
          lasers.remove(l);
          monsters.remove(r);
        }
        if (l.reachedTop()) {
          lasers.remove(l);
        } else {
          l.display ();
          l.move ();
        }
      }
    }
    s1.display (mouseX, mouseY);
    infoPanel ();
    //game over logic
    if (s1.health < 1) {
      gameOver ();
    }
  }
}

void infoPanel () {
  fill (129, 128);
  noStroke ();
  rect (10, 15, 470, 40);
  fill (255);
  textSize (20);
  text ("SPACEGAME" + " | Health:" + s1.health +" | Score:" + score + " | Ammo: " +s1.ammo, 250, 40);
}

//laser based event
void mousePressed () {
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser (s1.x, s1.y));
    println ("Lasers:" + lasers.size());
  } else   if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser (s1.x - 37, s1.y - 25));
    lasers.add(new Laser (s1.x + 37, s1.y - 25));
    println ("Lasers:" + lasers.size());
  }
}

void keyPressed () {
  if (key == ' ') {
    if (s1.fire() && s1.turretCount == 1) {
      lasers.add(new Laser (s1.x, s1.y));
      println ("Lasers:" + lasers.size());
    } else   if (s1.fire() && s1.turretCount == 2) {
      lasers.add(new Laser (s1.x - 37, s1.y - 25));
      lasers.add(new Laser (s1.x + 37, s1.y - 25));
      println ("Lasers:" + lasers.size());
    }
  }
}

void startScreen () {
  background (0);
  fill (222);
  textAlign (CENTER);
  text ("Press any key to begin...", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
  }
}

void gameOver () {
  background (0);
  fill (222);
  textAlign (CENTER);
  text ("Game Over!", width/2, height/2);
  noLoop ();
}
