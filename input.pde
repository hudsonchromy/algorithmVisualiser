void mousePressed() {
  //println(screen);
  if(screen == bfsScreen || screen == aStarScreen) {
    if(editing && mouseY < 750 && mouseX < 750) {
      makePath();
    }
    if(mouseY >= 750) {
      menuButtons();
    }
  }
   else if(screen == 101 || screen == 102) {
     println("::::::::::");
     menuButtons();
   }
   else if(screen == 0) {
    mainMenuButtons();
  }
  
}

void keyPressed() {
  if(!(screen == 101 || screen == 102)) {
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
    //S
    //else if(keyCode == 83) {
    //  makeFile();
    //}
    //D
    else if(keyCode == 68) {
      screen = 100 + screen;
    } 
    else if (keyCode == 76) {
      set();
    }
  } else {
    gettingInput(keyCode, key);
  }
}


 public void menuButtons() {
   if(editingButton.isClicked()) {
    editing = !editing;
    //System.out.println("----------\nMouse 1\n------------");
  }
  else if(bfsButton.isClicked()) {
    lengthPath = bfs();
    //System.out.println(lengthPath);

  }
  else if(aStarButton.isClicked()) {
    lengthPath = aStar();
  }
  else if(resetButton.isClicked()) {
    reset();
  }
  else if (secondDelayButton.isClicked()) {
    delayTime = delayTime + 10;
    firstDelayButton.setText("TD: " + delayTime);
  }
  else if (firstDelayButton.isClicked()) {
    delayTime += 100;
    if(delayTime > 1000) delayTime -= 1000;
    firstDelayButton.setText("TD: " + delayTime);
  }
  else if (invertButton.isClicked()) {
    invertColors();
  }
  else if (gotoMMButton.isClicked()) {
    set();
    screen = 0;
  }
  else if(inButton.isClicked()) {
    readFileIn();
  }
  else if(outButton.isClicked()) {
    makeFile();
  }
 }
 
 
 
   public void makePath() {
    int j = (int)(mouseX / (width / cols));
    int i = (int)(mouseY / (height / rows));
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
  
  public void mainMenuButtons() {
    if(bfsMMButton.isClicked()) {
      System.out.println("]]]]]");
      screen = 1;
    } else if(aStarMMButton.isClicked()) {
      System.out.println("[[[[[[[[[");
      screen = 2;
    } else if(settingButton.isClicked()) {
      System.out.println("|||||||||||");
      screen = 4;
    }
  }
  
  

  
  
  
