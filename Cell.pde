class Cell {
  // A cell object knows about its location in the grid 
  // as well as its size with the variables x,y,w,h
  float x,y;   // x,y location
  float w,h;   // width and height
  int i, j;
  boolean visited = false;
  boolean moveable = false;
  int[] c;
  float f = 100000000;
  float g;
  float hx = 1000000000;
   Cell refersTo;
  final int[] cOff = {120, 182, 157};


  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, int iIn, int jIn) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    i = iIn;
    j = jIn;
    c  = cOff;
  } 
  
  public Cell getRefersTo() {
    return refersTo;
  }
  
  public void setRefersTo(Cell c) {
    refersTo = c;
  }
  
  public float gethx(){
    return hx;
  }
  
  public void sethx(float hIn) {
    hx = hIn;
  }
  
  public float getgx() {
    return euchlideanDistance(this);
  }
  
  public String summary() {
    return i + " -- " + j;
  }
  
  public int getI() {
    return i;
  }
  
  public int getJ() {
    return j;
  }
  
  public boolean getMoveable() {
    return moveable;
  }
  
  public void setMoveable(boolean mIn) {
    moveable = mIn;
    if(this.equals(end)) {
      c = ends;
    }
    else if(moveable){
      c = path;
    } else {
      c = cOff;
    }
  }
  
  public void switchMoveable() {
    setMoveable(!moveable);
  }
  
  public boolean getVisited() {
    return visited;
  }
  
  public void setVisited(boolean vIn) {
    visited = vIn;
  }
  
  public int[] getColor() {
    return c;
  }
  
  public int[] getPos() {
    int[] pos = {i, j};
    return pos;
  }
  
  public void setColor(int[] cIn) {
    c = cIn;
  }
  
  public Cell getNext(int dirMove) {
    int xNew = i + getChangeX(dirMove);
    int yNew = j + getChangeY(dirMove);
    return grid[yNew][xNew];
  }
  
  public boolean canMove(int dirMove) {
    int xNew = i + getChangeX(dirMove);
    int yNew = j + getChangeY(dirMove);
    //System.out.println("111111111111111111111");
    //System.out.println(yNew);
    //System.out.println(xNew);
    //System.out.println(!(yNew >= 0 && yNew < cols && xNew >= 0 && xNew < rows ));
    
    
    if(!(yNew >= 0 && yNew < rows && xNew >= 0 && xNew < cols )) {
      return false;
    }
    //System.out.println(grid[yNew][xNew].getVisited());
    if(grid[yNew][xNew].getVisited()) {
      return false;
    }
    //System.out.println(Arrays.toString(grid[yNew][xNew].getColor()));
    //System.out.println(!grid[yNew][xNew].getMoveable());
    if(!grid[yNew][xNew].getMoveable()) {
      return false;
    }
    return true;
  }
  

  
  void display() {
    fill(c[0], c[1], c[2]);
    rect(x,y,w,h); 
  }
  
  public float getF() {
    if(f == 100000000) {
      f = getgx() + hx;
    }
    return f;
  }
}





public float totalF(Cell cell) {
  return euchlideanDistance(cell) + manhattanDistance(cell);
}

public float euchlideanDistance(Cell cell) {
  return sqrt( sq(end.getI() - cell.getI()) + sq(end.getJ() - cell.getJ()) );
}


public float manhattanDistance(Cell cell) {
  return abs(end.getI() - cell.getI()) + abs(end.getJ() - cell.getJ());
}
