

 public void set() {
   lengthPath = 111111;
   aStarDone = false;
   Q.clear();
   order.clear();
   ccount = 0;
   finalCurPath = null;

   
   for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      if(grid[j][i].getMoveable()) {
        grid[j][i].setVisited(false);
        grid[j][i].setColor(path);
      }
    }
  }
  start.setColor(ends);
  start.setVisited(true);
  end.setMoveable(true);
  end.setColor(ends);
  ccount = 0;
 }
