//Pax Ferguson || 10/31/22 || Calculator

Button [] numButtons = new Button [10];
Button [] opButtons = new Button [13];
String dVal = "0";
char op = ' ';
float l, r, result;
boolean left = true;

void setup () {
  size (265, 550);
  numButtons[0] = new Button (35, 257, 60, 60, '7');
  numButtons[1] = new Button (35, 322, 60, 60, '4');
  numButtons[2] = new Button (35, 387, 60, 60, '1');
  numButtons[3] = new Button (100, 257, 60, 60, '8');
  numButtons[4] = new Button (100, 322, 60, 60, '5');
  numButtons[5] = new Button (100, 387, 60, 60, '2');
  numButtons[6] = new Button (100, 452, 60, 60, '0');
  numButtons[7] = new Button (165, 257, 60, 60, '9');
  numButtons[8] = new Button (165, 322, 60, 60, '6');
  numButtons[9] = new Button (165, 387, 60, 60, '3');
  opButtons[0] = new Button (35, 193, 60, 60, 'C');
  opButtons[1] = new Button (35, 452, 60, 60, '.');
  opButtons[2] = new Button (100, 192, 60, 60, '÷');
  opButtons[3] = new Button (165, 192, 60, 60, 'X');
  opButtons[4] = new Button (165, 452, 60, 60, '±');
  opButtons[5] = new Button (230, 192, 60, 60, '⌫');
  opButtons[6] = new Button (230, 257, 60, 60, '-');
  opButtons[7] = new Button (230, 322, 60, 60, '+');
  opButtons[8] = new Button (230, 420, 60, 125, '=');
  opButtons[9] = new Button (35, 517, 60, 60, 'π');
  opButtons[10] = new Button (100, 517, 60, 60, '√');
  opButtons[11] = new Button (165, 517, 60, 60, '²');
  opButtons[12] = new Button (230, 517, 60, 60, '%');
}

void draw () {
  background (200);
  for (int i=0; i<numButtons.length; i++) {
    numButtons [i].display ();
    numButtons [i].hover (mouseX, mouseY);
  }

  for (int i=0; i<opButtons.length; i++) {
    opButtons [i].display ();
    opButtons [i].hover (mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed () {
  println("key"+key);
  println("keyCode:"+keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 47 || keyCode == 111) {
    handleEvent("÷", false);
  } else if (keyCode == 61 || keyCode == 107) {
    handleEvent("+", false);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 8) {
    handleEvent("C", false);
  } else if (keyCode == 88 || keyCode == 106) {
    handleEvent("X", false);
  } else if (keyCode == 10) {
    performCalculation();
  }
}

void handleEvent (String val, boolean num) {
  if (num) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float (dVal);
    }
  } else if (val.equals("C")) {
    dVal = "0.0";
    op = ' ';
    l = 0.0;
    r = 0.0;
    result = 0.0;
    left = true;
  } else if (val.equals (".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  } else if (val.equals("÷")) {
    dVal = "";
    op = '÷';
    left = false;
  } else if (val.equals("+")) {
    dVal = "";
    op = '+';
    left = false;
  } else if (val.equals("-")) {
    dVal = "";
    op = '-';
    left = false;
  } else if (val.equals("X")) {
    dVal = "";
    op = 'X';
    left = false;
  }
}


void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on && dVal.length()<20) {
      handleEvent( str(numButtons[i].val), true);
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      handleEvent ("C", false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      handleEvent("=", false);
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      handleEvent("-", false);
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      handleEvent("÷", false);
    } else if (opButtons[i].on && opButtons[i].val == 'X') {
      handleEvent("X", false);
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent (".", false);
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (left == true) {
        l = l*-1;
        dVal = str(l);
      } else {
        r=r*-1;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '²') {
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else {
        r = sq (r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      if (left) {
        l = PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt (r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '%') {
      if (left) {
        l = (l*0.01);
        dVal = str(l);
      } else {
        r = (r*0.01);
        dVal = str(r);
      }
    }
  }
  println("l:" + l + " r:" + r + " op:" + op + " Left:" + left + " Result:" + result);
}

void updateDisplay () {
  fill (#545F64);
  rect (132, 85, 250, 140);
  fill(255);
  textSize (35);
  textAlign (TOP, LEFT);
  if (dVal.length()<15) {
    textSize (35);
  } else if (dVal.length()<16) {
    textSize (31);
  } else if (dVal.length()<17) {
    textSize (29);
  } else if (dVal.length()<18) {
    textSize (26);
  } else if (dVal.length()<19) {
    textSize (24);
  } else if (dVal.length()<20) {
    textSize (21);
  } else {
    textSize (20);
  }
  text (dVal, width-250, 90);
}

void performCalculation () {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'X') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  }
  dVal = str(result);
  //l = result;
  left = true;
}
