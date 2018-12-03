int ind = 0;
void drawAStar() {  
  //System.out.println(aStarDone);
  ind++;
  //System.out.println("---");
  background(0);
  
  editingButton.display();
  aStarButton.display();
  secondDelayButton.display();
  firstDelayButton.display();
  resetButton.display();
  invertButton.display();
  gotoMMButton.display();
  
  fill(sideText[0], sideText[1], sideText[2]);
  textSize(20);
  text("Path\nLength", 750, 20);
  text(lengthPath - 1, 750, 80);
  
  text("Search\nSpace", 750, 110);
  text(searchSpaceNum, 750, 170);
  
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      grid[j][i].display();
    }
  }
  if(aStarDone) {
    println(ccount);
    if((int)(millis() - startTime) > delayTime) {
      //System.out.println(millis());
      timeShowAStar(ccount);
      ccount++;
      startTime = millis();
      start.setColor(ends);
      end.setColor(ends);
    }
  }
  else {
    startTime = millis();
  }
  inButton.display();
  outButton.display();
  if(screen == 102) {
    fill(24, 32, 39);
    rect(0, 0, 200, 60);
    fill(238, 60, 60);
    text(inp, 10, 30);
  }
}

public void timeShowAStar(int countStop) {
  println("---------");
  int count = 0;
  for(Cell c: searchSpace) {
    c.setColor(visitedC);
    if(count > countStop) return;
    count++;
  }
  for(Cell c: order) {
    c.setColor(pathShortest);
    if(count > countStop) return;
    count++;
  }
  ccount = 0;
  aStarDone = false;
}
