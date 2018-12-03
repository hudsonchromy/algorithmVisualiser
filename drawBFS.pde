void drawBFS() {
  
  background(0);
  

  
  editingButton.display();
  bfsButton.display();
  secondDelayButton.display();
  firstDelayButton.display();
  resetButton.display();
  invertButton.display();
  gotoMMButton.display();
  
  
  
  

  
  fill(sideText[0], sideText[1], sideText[2]);
  textSize(20);
  text("Path\nLength", 750, 20);
  text(lengthPath - 2, 750, 80);
  
  text("Search\nSpace", 750, 110);
  text(searchSpaceNum, 750, 170);
  
  //System.out.println(Arrays.toString(grid[0][2].getColor()));
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      grid[j][i].display();
    }
  }
  
  if(finalCurPath != null) {
    if((int)((millis() - startTime)) >= delayTime) {
      //System.out.println(millis());
      timeShow(ccount);
      ccount++;
      startTime = millis();
    }
  }
  else {
    startTime = millis();
  }
  inButton.display();
  outButton.display();
  if(screen == 101) {
    fill(24, 32, 39);
    rect(0, 0, 200, 60);
    fill(238, 60, 60);
    text(inp, 10, 30);
  }
  //testShow();
}

 public int timeShow(int countStop) {
    int count = 0;
    for(Cell c: order) {
      if(count > countStop) return 1;
      count++;
      c.setColor(visitedC);
      c.display();
    }
    for(int index = 1; index < finalCurPath.length - 1; index++) {
      if(count > countStop) return 1;
      count++;
      finalCurPath[index].setColor(pathShortest);
      finalCurPath[index].display();
    }
    if(count > countStop) return 1;
    if(countStop % 2 == 0) {
      end.setColor(blinkOne);
      end.display();
    } else {
      end.setColor(blinkTwo);
      end.display();
    }
    return 0;
 }
