// Pax Ferguson | Sept 7 2022 | Shapes

// Setup runs one times at start
void setup() {
  size(650,550);
  background(128);
}

// Draw runs on a loop at 30 fps
void draw() {
  //background(128);
  line(0,100,width,100);
  line(0,200,width,200);
  line(0,300,width,300);
  line(0,400,width,400);
  line(0,500,width,500);
  line(100,0,100,height);
  line(200,0,200,height);
  line(300,0,300,height);
  line(400,0,400,height);
  line(500,0,500,height);
  line(600,0,600,height);
  fill(255,255,0);
  rect(20,20,120,120);
  rect(180,20,120,120,20);
  rect(340,20,120,120,20,10,25,50);
  rect(500,40,120,80);
  fill(250,0,0);
  circle(80,250,120);
  ellipse(240,240,120,80);
  ellipse(400,240,80,120);
  fill(0,0,250);
  triangle(500,300,550,180,610,300);
  triangle(40,340,20,420,150,450);
  fill(#79FFF3);
  quad(180,340,300,340,300,380,180,460);
  quad(400,340,440,400,400,460,360,400);
  quad(500,340,620,400,500,460,550,400);
  fill(250);
  text("100",91,12);
  text("200",191,12);
  text("300",291,12);
  text("400",391,12);
  text("500",491,12);
  text("600",591,12);
  text("100",0,103);
  text("200",0,203);
  text("300",0,303);
  text("400",0,403);
  text("500",0,503);
  fill(128);
  ellipse(mouseX,mouseY,100,100);
  fill(random(255));
  circle(random(width),random(height),random(10,60));
}
