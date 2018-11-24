void mousePressed() {
  if(editing && mouseY < 750 && mouseX < 750) {
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
  else if(keyCode == 49) {
    editMode = 0;
    editButton = "Switch";
  }
  //Q
  else if(keyCode == 81) {
    System.out.println("Q");
    editButton = "On";
    editMode = 1;
  }
  //A
  else if(keyCode == 65) {
    editButton = "Start";
    editMode = 2;
  }
  //Z
  else if(keyCode == 90) {
    editButton = "End";
    editMode = 3;
  }
}


 public void menuButtons() {
   if(mouseX <= 80) {
    editing = !editing;
    //System.out.println("----------\nMouse 1\n------------");
  }
  else if(mouseX <= 180) {
    //System.out.println("----------\nButton 2 \n-----------");
    lengthPath = bfs();
    System.out.println(lengthPath);
    //System.out.println("----------\nButton 2 2\n-----------");
  }
  else if(mouseX <= 280) {
    reset();
  }
  else if (mouseX <= 340) {
    delayTime += 100;
    if(delayTime > 1000) delayTime -= 1000;
  }
  else if (mouseX <= 380) {
    delayTime = delayTime + 10;
  }
  else if (mouseX <= 480) {
    invertColors();
  }
 }
 
 
 
   public void makePath() {
    int j = (int)(mouseX / (width / rows));
    int i = (int)(mouseY / (height / cols));
    if(i > rows -1 || j > cols - 1) {
      return;
    }
    if(editMode == 0) {
      if(!(i == 0 && j == 0) && !(i == rows-1 && j == cols-1) && (i < rows) && (j < cols)) {
        grid[i][j].switchMoveable();
      }
    }
    else if(editMode == 1) {
      grid[i][j].setMoveable(true);
    }
    else if(editMode == 2) {
      start.setColor(cOff);
      start = grid[i][j];
      start.setColor(ends);
    }
    else if(editMode == 3) {
      end.setColor(cOff);
      end = grid[i][j];
      end.setMoveable(true);
      end.setColor(ends);
    }
  }
