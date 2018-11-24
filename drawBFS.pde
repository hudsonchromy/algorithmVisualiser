void drawBFS() {
  //System.out.println("=-=-=-=-=");
  
  background(0);
  
  fill(100, 100, 100);
  //BUTTONS
  //edit
  rect(0, 750, 80, 50);
  //breadth first search
  rect(100, 750, 80, 50);
  //reset
  rect(200, 750, 80, 50);
  //time delay
  rect(300, 750, 80, 50);
  //invert
  rect(400, 750, 80, 50);
  
  
  fill(120, 182, 157);
  textSize(20);
  text(editButton, 5, 770);
  text(BFSButton, 105, 770);
  text(resetButton, 205, 770);
  text("TD", 305, 770);
  text(delayTime, 335, 770);
  text("Invert", 405, 770);
  
  fill(sideText[0], sideText[1], sideText[2]);
  textSize(20);
  text("Path\nLength", 750, 20);
  text(lengthPath, 750, 80);
  
  //System.out.println(Arrays.toString(grid[0][2].getColor()));
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      grid[j][i].display();
    }
  }
  
  if(finalCurPath != null) {
    if((int)((millis() - startTime) / delayTime) == ccount) {
      //System.out.println(millis());
      timeShow(ccount);
      ccount++;
    }
  }
  else {
    startTime = millis();
  }
  //testShow();
}
