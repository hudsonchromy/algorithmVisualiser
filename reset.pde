 public void reset() {
   lengthPath = 111111;
   aStarDone = false;
   Q.clear();
   order.clear();
   ccount = 0;
   finalCurPath = null;

   
   for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      grid[j][i] = new Cell(i*(height/cols),j*(width/rows),(height/cols),(width/rows), i, j);
    }
  }
  start = grid[0][0];
  end = grid[rows-1][cols-1];
  start.setColor(ends);
  start.setVisited(true);
  end.setMoveable(true);
  end.setColor(ends);
  ccount = 0;
 }
