// Pax ferguson | 9/19/22 | Grades assignment
float val; // Gloval variable

void setup () {
  size (1000, 200);
  val = 0.0;
}

void draw () {
  background (127);
  val = mouseX * 0.004;
  noCursor ();
  line (0, 100, width, 100);
  ellipse (mouseX, 100, 10, 10);
  textAlign (CENTER);
  textSize (18);
  //text (mouseX, mouseX, 90);
  text (val, mouseX, 120);
  textSize (18);
  text (calcGrade(val), width/2, 150);
  for(int i=0; i<1100; i=i+100) {
    line (i, 95,i,105);
    text (i/250.0, i, 85);
  }
  textAlign (CENTER);
  textSize (25);
  text ("Grades: by Pax Ferguson", width/2,40);
}

String calcGrade (float grade) {
  String letterGrade = "";
  if (grade>3.50) {
    letterGrade = "A";
  } else if (grade>2.99) {
    letterGrade = "-A";
  } else if (grade>2.83) {
    letterGrade = "+B";
  } else if (grade>2.66) {
    letterGrade = "B";
  } else if (grade>2.49) {
    letterGrade = "-B";
  } else if (grade>2.33) {
    letterGrade = "+C";
  } else if (grade>2.16) {
    letterGrade = "C";
  } else if (grade>1.99) {
    letterGrade = "-C";
  } else if (grade>1.65) {
    letterGrade = "+D";
  } else if (grade>1.32) {
    letterGrade = "D";
  } else if (grade>0.99) {
    letterGrade = "-D";
  } else {
    letterGrade = "F";
  }
  return letterGrade;
}
