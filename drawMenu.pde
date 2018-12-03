

void drawMenu() {
  background(100, 87, 87);
  
  
  
  fill(238, 60, 60);
  textSize(70);
  text("Algorithm Visualiser", 60, 60);
  
  
  
  
  aStarMMButton.display();
  bfsMMButton.display();
  //settingButton.display();
  image(settingImg, 700, 100, 80, 80);
}
