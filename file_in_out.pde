static String fileName = "maze.txt";
boolean gettingInput = false;
String inp = "";

public void makeFile() {
  output = createWriter(inp);
  for(int j = 0; j < rows; j++) {
    for(int i = 0; i < cols; i++) {
      if(grid[j][i].equals(end)) {
        output.print("E");
      } else if(grid[j][i].equals(start)){
        output.print("S");
      } else if(grid[j][i].getMoveable()) {
        output.print(1);
      } else {
        output.print(0);
      }
    }
    output.println();
  }
  output.flush();
  output.close();
  screen -= 100;
}

public void readFileIn() {
  println("||||||||||||");
  reset();
  String[] lines = loadStrings(inp);
  boolean endSet = false;
  boolean startSet = false;
  try {
    rows = lines.length;
  } catch (java.lang.NullPointerException n) {
    return;
  }
  cols = lines[0].length();
  grid = new Cell[rows][cols];
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
    grid[j][i] = new Cell(i*(height/cols),j*(width/rows),(height/cols),(width/rows), i, j);
    switch(lines[j].charAt(i)) {
      case 'E':
        if(!endSet){
          end = grid[j][i];
          grid[j][i].setColor(ends);
          endSet = true;
          end.setMoveable(true);
        }
        continue;
      case 'S':
        if(!startSet) {
          start = grid[j][i];
          start.setColor(ends);
          startSet = true;
        }
        continue;
      case '1':
        //grid[j][i].setColor(path);
        grid[j][i].setMoveable(true);
      default:
        continue;
    }
  }
 }
 if(!endSet) {
   end = grid[rows-1][cols-1];
   end.setMoveable(true);
 }
 if(!startSet) {
   start = grid[0][0];
   start.setColor(ends);
 }
 screen = screen - 100;
}

public void gettingInput(int kc, char k) {
  if (kc == BACKSPACE) {
    if (inp.length() > 0) {
      inp = inp.substring(0, inp.length()-1);
    }
  } else if (kc == DELETE) {
    inp = "";
  } else if (kc != SHIFT && keyCode != CONTROL && kc != ALT) {
    inp = inp + k;
  }
}
