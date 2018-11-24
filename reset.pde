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
  start = grid[0][0];
  end = grid[cols-1][rows-1];
  start.setColor(ends);
  start.setVisited(true);
  end.setMoveable(true);
  end.setColor(ends);
 }
