public class Button {
  private int x, y, w, h, xOffset, yOffset, textSize;
  private int[] s;
  private String text;
  public Button(int xIn, int yIn, int wIn, int hIn, int xOIn, int yOIn, String textIn, int tsIn, int[] sIn) {
    x = xIn;
    y = yIn;
    xOffset = xOIn;
    yOffset = yOIn;
    w = wIn;
    h = hIn;
    text= textIn;
    textSize = tsIn;
    s = sIn;
  }
  public void setText(String tIn) {
    text = tIn;
  }
  public void display() {
    if(isScreen()) {
      fill(24, 32, 39);
      rect(x, y, w, h);
      
      fill(238, 60, 60);
      textSize(textSize);
      text(text, x + xOffset, y + yOffset);
    }
  }
  public boolean isClicked() {
    if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h ) {
      for(int i: s) {
        if(i == screen) {
          return true;
        }
      }
    }
  return false;
  }
  private boolean isScreen() {
    for(int i: s) {
      if(i == screen) {
        return true;
      }
    }
    return false;
  }
}
