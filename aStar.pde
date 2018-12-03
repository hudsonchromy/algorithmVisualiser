boolean aStarDone = false;


public int aStar() {
  set();
  searchSpace.clear();
  System.out.println("::::::::::::");
  Cell current = start;
  ArrayList<Cell> adj = new ArrayList<Cell>();
  PriorityQueue <Cell> pq = new PriorityQueue<Cell>(new fComparator());
  pq.add(start);
  start.sethx(0);
  while(pq.size() > 0) {
    current = pq.poll();
    searchSpace.add(current);
    if(current.equals(end)) {
      searchSpaceNum = searchSpace.size();
      order = tracePath(current);
      aStarDone = true;
      return order.size();
    } else {
      current.setVisited(true);
      adj = neighbors(current);
      for(Cell c: adj) {
        if(c.gethx() - 1 > current.gethx()) {
          c.sethx(current.gethx() + 1);
        }
        c.setRefersTo(current);
        pq.add(c);
      }
    }
  }
  return 2000000;
}




public ArrayList<Cell> tracePath(Cell end) {
  ArrayList<Cell> apath = new ArrayList<Cell>();
  Cell current = end;
  while(!current.equals(start)) {
    apath.add(current);
    current = current.getRefersTo();
  }
  return apath;
}






public ArrayList<Cell> neighbors(Cell cCell) {
  ArrayList<Cell> cells = new ArrayList<Cell>();
  for(int i = 0; i < 4; i++) {
    if(cCell.canMove(i) && !cCell.getNext(i).getVisited()) {
      cells.add(cCell.getNext(i));
      cCell.getNext(i).setVisited(true);
    }
  }
  //for(Cell c: cells) {
  //  System.out.println(c.getI());
  //}
  //System.out.println(cells.size());
  return cells;
}
