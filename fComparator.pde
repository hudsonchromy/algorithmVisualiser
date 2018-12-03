public class fComparator implements Comparator<Cell> {
  public int compare(Cell c1, Cell c2) {
    if(abs(c1.getF() - c2.getF()) < 0.00001) {
      return 0;
    } else if(c1.getF() > c2.getF()) {
      return 1;
    } else {
      return -1;
    }
  }
}
