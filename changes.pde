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
