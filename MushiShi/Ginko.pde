class Ginko extends PlayerObject {
  PImage Player;
  PImage spriteSheet;
  PImage [][]movement;

  float x, y;
  int currentFrame;
  int currentSpriteNum;

  Vector velocity;

  int health = 10;
  int currentDirection;

  Ginko(float startPosX, float startPosY) {
    SpriteSetup();
    Player = movement[0][0];

    pos = new Vector(startPosX, startPosY);
    velocity = new Vector(0, 0);
    width = (int)(108);
    height = (int)(256);
    
    currentFrame = 0;
    currentSpriteNum = 0;
  }

  void display() {
    image(Player, pos.x, pos.y, width, height);

    //HEALTHBAR
    fill(34, 139, 34);
    rect(pos.x - 200/2 + 50, pos.y-80, 20*health, 23);
  }

  void move() {
    currentFrame++;
    if(currentFrame % 20 == 0){
      currentSpriteNum++;
      currentSpriteNum = currentSpriteNum % 4; 
    }
    
    
    pos.add(velocity);

    if(velocity.x > 0){
      Player = movement[0][currentSpriteNum];
    } else {
      Player = movement[2][currentSpriteNum];
    }

    if(velocity.x < 0.1 && velocity.x > -0.1){
      Player = movement[0][0];
    }

  }

  void SpriteSetup() {
    movement = new PImage[4][5];

    spriteSheet = loadImage("GinkoSprite.png");
    for (int i = 0; i < 4; i++) {
      //rightwards movement
      movement[0][i] = spriteSheet.get(0 + 108*i + 153*i, 0, 108, 256);
      
      //leftwards movement
      movement[2][i] = spriteSheet.get(0 + 108*i + 153*i, 2*256, 108, 256);
    }
  }

}
