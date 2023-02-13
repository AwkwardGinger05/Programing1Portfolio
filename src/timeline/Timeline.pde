//Pax Ferguson | Sept 12 2022 | Timeline

void setup() {
  size (980, 400);
  background (#868585);
}

void draw() {
  background (#868585);

  //render
  textSize (40);
  textAlign(CENTER);
  text ("Historic Computer Systems", width/2, 50);
  textSize (20);
  text("by Pax Ferguson", width/2, 77);
  strokeWeight (1.13);
  line (100, 200, 830, 200);
  textSize (18);
  text("1930", 75, 205);
  text("1980", 855, 205);

  //Call hist event function
  histEvent(180, 160, "Z2 - 1940", "An electromechanical computer created by German engineer Konrad Zuse. \nReplaced the arithmetic and control logic with 600 electrical relay circuits.");
  histEvent(340, 160, "Colossus - 1945", "Used vacuum tubes to perform Boolean and counting operations. \nRegarded as the world's first programmable, electronic, digital computer.");
  histEvent(500, 160, "Transistor - 1950s", "Better know now as a second-gen computer, it is a computer that uses discrete ransistors instead of vacuum tubes. \nThere were large, bulky, generated lots of heat and were overall unreliable.");
  histEvent(660, 160, "Mainframe - 1960s", "A computer that is used primarily by large organizations for critical appplications like bulk data processing. \nLarge and has more processing power than other classes of computers.");
  histEvent2(270, 240, "Berry Computer - 1942", "First automatic electronic digital computer. \nNeither programmable, nor Turning-complete.");
  histEvent2(430, 240, "ENIAC - 1945", "The ENIAC was similar to the Colossus with being the first programable computers. \nThough it was much faster, more flexible, and came in one big package.");
  histEvent2(590, 240, "Harwell CADET - 1955", "First fully transistorised computer in Europe and possibly the world. \n Used first stage amplifiers for data read from the drum.");
  histEvent2(750, 240, "Desktop - 1970's", "Personal computer used for regular use at a singular location. \nA common computer used by consumers all around the world.");
}

void histEvent(int x, int y, String title, String detail) {
  line (x, y, x+20, y+40);
  rectMode (CENTER);
  fill (#C9C9C9);
  rect(x, y, 150, 30, 8);
  fill (0);
  textSize (14);
  text(title, x, y+7);
  if (mouseX > x-75 && mouseX < x+75 && mouseY > y-15 && mouseY < y+15) {
    text(detail, width/2, 340);
    textSize(15);
  }
}

// bottom histEvent
void histEvent2(int x, int y, String title, String detail2) {
  line (x, y, x-20, y-40);
  rectMode (CENTER);
  fill (#C9C9C9);
  rect(x, y, 150, 30, 8);
  fill (0);
  textSize (14);
  text(title, x, y+7);
  if (mouseX > x-75 && mouseX < x+75 && mouseY > y-15 && mouseY < y+15) {
    text(detail2, width/2, 340);
    textSize(15);
  }
}
