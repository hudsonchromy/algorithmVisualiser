import java.io.*;
import java.util.*;


static Cell[][] grid;
//i = row
//j = col
// Number of columns and rows in the grid
static int cols = 20;
static int rows = 20;
static int ccount = 0;
static int delayTime = 100;
static int startTime;
static int timing;
static boolean[][] visited = new boolean[rows][cols];
static Queue<Cell[]> Q = new LinkedList<Cell[]>();
int height = 750;
int width = 750;
static final int UP = 0;
static final int RIGHT = 1;
static final int DOWN = 2;
static final int LEFT = 3;
ArrayList<Cell> order = new ArrayList<Cell>();
static int delayNum = 10;
static Cell[] finalCurPath;
static int[] testC = {100, 245, 6};
static int[] path = {238, 60, 60};
final int[] cOff = {120, 182, 157};
static int[] pathShortest = {24, 32, 39};
static int[] ends = {100, 87, 87};
static int[] visitedC = {243, 232, 178};
static int[] blinkOne = {255, 48, 54};
static int[] blinkTwo = {224, 175, 70};
boolean editing = true;

static String editButton = "Edit";
static String BFSButton = "BFS";
static String resetButton = "Reset";


//Start and End
Cell start;
Cell end;




void setup() {
  System.out.println("=");
  //printArray(Serial.list());
  //myPort = new Serial(this, Serial.list()[0], 9600);
  size(750, 800);
  grid = new Cell[cols][rows];
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      // Initialize each object
      grid[j][i] = new Cell(i*(width/rows),j*(height/cols),(width/rows),(height/cols), i, j);
    }
  }
  grid[0][0].setColor(ends);
  grid[cols-1][rows-1].setMoveable(true);
  grid[cols-1][rows-1].setColor(ends);
  grid[0][0].setVisited(true);
  //System.out.println(Arrays.toString(grid));
}

void draw() {
  //System.out.println("=-=-=-=-=");
  
  background(0);
  
  fill(100, 100, 100);
  //BUTTONS
  //edit
  rect(0, 750, 80, 50);
  //breadth first search
  rect(100, 750, 80, 50);
  //reset
  rect(200, 750, 80, 50);
  //time delay
  rect(300, 750, 80, 50);
  //invert
  rect(400, 750, 80, 50);
  
  
  fill(120, 182, 157);
  textSize(20);
  text(editButton, 5, 770);
  text(BFSButton, 105, 770);
  text(resetButton, 205, 770);
  text("TD", 305, 770);
  text(delayTime, 335, 770);
  text("Invert", 405, 770);
  
  //System.out.println(Arrays.toString(grid[0][2].getColor()));
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      grid[j][i].display();
    }
  }
  
  if(finalCurPath != null) {
    if((int)((millis() - startTime) / delayTime) == ccount) {
      //System.out.println(millis());
      timeShow(ccount);
      ccount++;
    }
  }
  else {
    startTime = millis();
  }
  //testShow();
}

void mousePressed() {
  if(editing && mouseY < 750) {
    makePath();
  }
  if(mouseY >= 750) {
    menuButtons();
  }
}

void keyPressed() {
  if(keyCode == 32) {
    makePath();
  }
}


public int bfs() {
  System.out.println("++++++++++++++++++++++++");
  //System.out.println(grid[1][0].getVisited());
  Cell[] start = {grid[0][0]};
  Q.offer(start);
  while(Q.size() != 0) {
    //delay(100);
    //System.out.print(Q);
    Cell[] curPath = Q.poll();
    Cell lastCell = curPath[curPath.length - 1];
    if(lastCell.equals(grid[rows-1][cols-1])) {
      //for(int index = 1; index < curPath.length - 1; index++) {
      //  curPath[index].setColor(pathShortest);
      finalCurPath = curPath;
      //}
      return curPath.length;
    }
    //System.out.println(Arrays.toString(lastCell.getColor()));
    for(int i = 0; i != 4; i++) {
      //delay(50);
      //delay(100);
      Cell[] newCurPath = Arrays.copyOf(curPath, curPath.length + 1);
      //System.out.println(lastCell.canMove2(i));
      if(lastCell.canMove(i)) {
        //System.out.println("");
        Cell newCell = lastCell.getNext(i);
        ///newCell.setColor(visitedC);
        order.add(newCell);
        newCell.setVisited(true);
        newCurPath[newCurPath.length - 1] = newCell;
        Q.offer(newCurPath);
        //grid[0][2].setColor(testC);
        //redraw();
        //updateMid();
        //fill(243, 232, 178);
        //System.out.println("hhhhhhhhhhh\nhhhhhhhhhhhhhhh\nhhhhhhhhhhhhhhhhhh\nhhhhhhhhhhhhhhhhh");
        //delay(5000000);
      }
    }
  }
  return 100000;
}




static int getChangeX(int dir) {
    switch (dir) {
      case LEFT:
        return -1;
      case RIGHT:
        return 1;
      default:
        return 0;
    }
  }

static int getChangeY(int dir) {
    switch (dir) {
      case UP:
        return -1;
      case DOWN:
        return 1;
      default:
        return 0;
    }
  }
  
  public void makePath() {
    int j = (int)(mouseX / (width / rows));
    int i = (int)(mouseY / (height / cols));
    if(!(i == 0 && j == 0) && !(i == rows-1 && j == cols-1) && (i < rows) && (j < cols)) {
      grid[i][j].switchMoveable();
    }
  }
 
 public void setTest() {
    grid[0][2].setColor(testC);
    fill(244, 1, 19);
    rect(50, 50, 300, 300);
 }
 
 public int timeShow(int countStop) {
    int count = 0;
    for(Cell c: order) {
      if(count > countStop) return 1;
      count++;
      c.setColor(visitedC);
      c.display();
    }
    for(int index = 1; index < finalCurPath.length - 1; index++) {
      if(count > countStop) return 1;
      count++;
      finalCurPath[index].setColor(pathShortest);
      finalCurPath[index].display();
    }
    if(count > countStop) return 1;
    if(countStop % 2 == 0) {
      grid[rows-1][cols-1].setColor(blinkOne);
      grid[rows-1][cols-1].display();
    } else {
      grid[rows-1][cols-1].setColor(blinkTwo);
      grid[rows-1][cols-1].display();
    }
    return 0;
 }
 
 public void reset() {
   for(boolean[] row: visited) {
     Arrays.fill(row, false);
   }
   Q.clear();
   order.clear();
   ccount = 0;
   finalCurPath = null;
   for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      // Initialize each object
      grid[j][i] = new Cell(i*(width/rows),j*(height/cols),(width/rows),(height/cols), i, j);
    }
  }
  grid[0][0].setColor(ends);
  grid[cols-1][rows-1].setMoveable(true);
  grid[cols-1][rows-1].setColor(ends);
  grid[0][0].setVisited(true);
 }
 
 
 public void invertColors() {
   for (int i = 0; i < rows; i++) {
     for(int j = 0; j < cols; j++) {
       if(!(i == 0 && j == 0) && !(i == rows -1 && j == cols -1)) {
         grid[i][j].switchMoveable();
       }
     }
   }
 }
 
 
 
 public void menuButtons() {
   if(mouseX <= 80) {
    editing = !editing;
    System.out.println("----------\nMouse 1\n------------");
  }
  else if(mouseX <= 180) {
    System.out.println("----------\nButton 2 \n-----------");
    System.out.println(bfs());
    System.out.println("----------\nButton 2 2\n-----------");
  }
  else if(mouseX <= 280) {
    reset();
  }
  else if (mouseX <= 340) {
    delayTime -= 100;
    if(delayTime < 0) delayTime = 0;
  }
  else if (mouseX <= 380) {
    delayTime += 100;
  }
  else if (mouseX <= 480) {
    invertColors();
  }
 }
 /*
 To Do
 Make the start and end switchable
 -make selector for block, calls switcher
 
 
 Ideas
 Adiascent is valid
 click for prolonged period to get more reset options
 Erratic ants visualizer
 Add support for import files
 Add custom flipping through time delay
 
 
 
 
 */
