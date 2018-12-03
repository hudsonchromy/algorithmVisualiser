public int bfs() {
  set();
  Cell[] firstQ = {start};
  Q.offer(firstQ);
  while(Q.size() != 0) {
    Cell[] curPath = Q.poll();
    Cell lastCell = curPath[curPath.length - 1];
    if(lastCell.equals(end)) {
      finalCurPath = curPath;
      startTime = millis();
      searchSpaceNum = order.size();
      return curPath.length;
    }
    for(int i = 0; i != 4; i++) {
      Cell[] newCurPath = Arrays.copyOf(curPath, curPath.length + 1);
      if(lastCell.canMove(i)) {
        Cell newCell = lastCell.getNext(i);
        order.add(newCell);
        newCell.setVisited(true);
        newCurPath[newCurPath.length - 1] = newCell;
        Q.offer(newCurPath);
      }
    }
  }
  Cell[] fcp = {end};
  finalCurPath = fcp;
  return 0;
}
