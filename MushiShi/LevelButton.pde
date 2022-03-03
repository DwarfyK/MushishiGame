class LevelButton {
  
  int rectX, rectY;
  int rectSize = 130;

  int my_scene_number;

  color rectColor, baseColor;
  color rectHighlight;
  color currentColor;
  color rectMousepress;
  boolean rectOver = false;
  boolean rectClick = false;
  boolean rectClicked = false;

  LevelButton(int X, int Y, int scene) {
    rectX = X;
    rectY = Y;
    rectColor = color(255, 191, 0);
    rectHighlight = color(225, 193, 110);
    baseColor = color(225, 193, 110);
    currentColor = baseColor;
    rectMousepress = color(50, 180, 50);
    my_scene_number = scene;
  }

  void Display() {
    fill(rectColor);
    if (rectOver) {
      fill(rectHighlight);
    }

    if (rectClicked) {
      fill(rectMousepress);
    }

    stroke(255);
    rect(rectX, rectY, rectSize, rectSize);
  }

  boolean check_if_clicked(int x, int y) {
    
    if ( overRect(rectX, rectY, rectSize, rectSize) ) {
      rectOver = true;
    } else {
      rectOver=false;
    }

    if (rectClick(rectX, rectY, rectSize, rectSize) ) {
      rectClicked=true;

      return true;
    } else {
      return false;
    }
  }

  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
  boolean rectClick(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height && mousePressed) {
      return true;
    } else {
      return false;
    }
  }
}
