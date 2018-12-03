import java.io.*;
import java.util.*;

PImage settingImg;
PrintWriter output;


static Cell[][] grid;
//i = row
//j = col
// Number of columns and rows in the grid
static int cols = 50;
static int rows = 50;
static int ccount = 0;
static int delayTime = 10;
static int lengthPath;
static int startTime;
static int timing;
static int screen = 0;
static int bfsScreen = 1;
static int aStarScreen = 2;
static int menuScreen = 0;
static int searchSpaceNum = 0;
static Queue<Cell[]> Q = new LinkedList<Cell[]>();

static Cell[][] lastCell = new Cell[rows][cols];


int height = 750;
int width = 750;
static final int UP = 0;
static final int RIGHT = 1;
static final int DOWN = 2;
static final int LEFT = 3;
ArrayList<Cell> order = new ArrayList<Cell>();
ArrayList<Cell> searchSpace = new ArrayList<Cell>();
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
static int[] sideText = {227, 207, 170};
boolean editing = true;

static String editButton = "Switch";
static int editMode = 0;
static String BFSButton = "BFS";
//static String resetButton = "Reset";


//Start and End
static Cell start;
static Cell end;

int[] menuOnly = {0};
int[] mazeScreens = {1, 2, 3, 101, 102};
int[] inputScreens = {101, 102};
int[] bfsScreenOnly = {1};
int[] aStarScreenOnly = {2};



Button aStarMMButton = new Button(150, 260, 450, 70, 168, 50,  "A Star", 40, menuOnly);
Button bfsMMButton = new Button(150, 120, 450, 70, 48, 50, "Breadth First Search", 40, menuOnly);
Button settingButton = new Button(700, 100, 80, 80, 0, 0, "", 1, menuOnly);

Button editingButton = new Button(0, 744, 80, 50, 10, 30, "Edit", 20, mazeScreens);
Button bfsButton = new Button(100, 744, 80, 50, 10, 30, "BFS", 20, bfsScreenOnly);
Button aStarButton = new Button(100, 744, 80, 50, 10, 30, "A*", 20, aStarScreenOnly);
Button firstDelayButton = new Button(300, 744, 80, 50, 10, 30, "TD: 30", 20, mazeScreens);
Button secondDelayButton = new Button(350, 744, 40, 50, 10, 30, "", 20, mazeScreens);
Button resetButton = new Button(200, 744, 80, 50, 10, 30, "Reset", 20, mazeScreens);
Button invertButton = new Button(400, 744, 80, 50, 10, 30, "Invert", 20, mazeScreens);
Button gotoMMButton = new Button(500, 744, 80, 50, 10, 30, "Menu", 20, mazeScreens);

Button inButton = new Button(200, 0, 100, 60, 10, 30, "In", 20, inputScreens);
Button outButton = new Button(300, 0, 100, 60, 10, 30, "Out", 20, inputScreens);




void setup() {
  settingImg = loadImage("settingIcon.png");
  size(820, 800);
  grid = new Cell[rows][cols];
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      // Initialize each object
      grid[j][i] = new Cell(i*(height/cols),j*(width/rows),(height/cols),(width/rows), i, j);
    }
  }
  start = grid[0][0];
  end = grid[rows-1][cols-1];
  start.setColor(ends);
  start.setVisited(true);
  end.setMoveable(true);
  end.setColor(ends);
  
  //System.out.println(Arrays.toString(grid));
}




void draw() {
  //println(screen);
  if(screen == bfsScreen || screen == 100 + bfsScreen) {
    drawBFS();
  } else if(screen == menuScreen) {
    drawMenu();
  } else if(screen == aStarScreen || screen == 100 + aStarScreen) {
    drawAStar();
  } else {
    drawSetting();
  }
}












  

 
 public void setTest() {
    grid[0][2].setColor(testC);
    fill(244, 1, 19);
    rect(50, 50, 300, 300);
 }
 

 

 
 
 public void invertColors() {
   for (int i = 0; i < rows; i++) {
     for(int j = 0; j < cols; j++) {
       if(!(grid[i][j].equals(start)) && !(grid[i][j].equals(end))) {
         grid[i][j].switchMoveable();
       }
     }
   }
 }
 
 
 

 /*
 To Do
 
 
 Ideas
 Adiascent is valid
 Erratic ants visualizer
 
 */
