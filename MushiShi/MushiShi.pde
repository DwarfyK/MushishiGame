import gifAnimation.*;
import processing.sound.*;

SoundFile file;

PImage[] animation;
Gif BgGif;

PImage[] animation2;
Gif BgGif2;

PImage BGMenu;
PImage BGScene1;
PImage BGScene2;
PImage BGScene3;
PImage DirtSquare;
PImage GrassDirtSquare;
PImage WoodSquare;
PImage StoneSquare;
PImage SnowSquare;
PImage SnowSquareTop;
PImage InvisSquare;



ArrayList<Scene> scenes = new ArrayList<Scene>();

int sceneNumber = 0;

Ginko g1;
Enemy enemy;
EnemyUro enemyuro;
EnemySnake enemysnake;
Square S1;
Square S2;


boolean grounded = false;
boolean [] keys;


void reset_levels() {
  scenes = new ArrayList<Scene>();

  Scene scene0 = new Scene(BgGif);
  Scene scene1 = new Scene(BGScene1);
  Scene scene2 = new Scene(BGScene2);
  Scene scene3 = new Scene(BGScene3);

  //scene2 = new Scene();
  //scene3 = new Scene();
  scenes.add(scene0);
  scenes.add(scene1);
  scenes.add(scene2);
  scenes.add(scene3);
  //scenes.add(scene2);
  //scenes.add(scene3);


  //ENEMIES
  scene1.enemies.add(new EnemyUro(200, 300));
  scene1.enemies.add(new EnemyUro(2000, 300));
  scene1.enemies.add(new EnemyUro(3000, 300));
  scene1.enemies.add(new EnemyUro(4000, 300));
  scene1.enemies.add(new EnemyUro(5000, 300));


  scene2.enemies.add(new Enemy(2000, 300));
  scene2.enemies.add(new Enemy(2500, 300));
  scene2.enemies.add(new Enemy(2600, 300));
  scene2.enemies.add(new Enemy(3000, 300));
  scene2.enemies.add(new Enemy(4000, 300));
  scene2.enemies.add(new Enemy(5000, 300));

  scene3.enemies.add(new EnemySnake(1500, 10));

  scene0.levelbuttons.add( new LevelButton(530, 500, 1));
  scene0.levelbuttons.add( new LevelButton(1150, 500, 2));

  //MENU RETURN BUTTON
  //scene1.levelbuttons.add( new LevelButton(1700, 30, 0));
  //scene2.levelbuttons.add( new LevelButton(1700, 30, 0));

  //SCENE 1

  //Floor
  for (int i = -30; i < 190; ++i) {
    scene1.squares.add(new Square(GrassDirtSquare, i*64 + 500, 900, false, 0));
    scene1.squares.add(new Square(DirtSquare, i*64 + 500, 964, false, 0));
    scene1.squares.add(new Square(DirtSquare, i*64 + 500, 1028, false, 0));
  }

  //Platform
  for (int i = 25; i < 28; ++i) {
    scene1.squares.add(new Square(WoodSquare, i*64 + 500, 772, false, 0));
  }
  for (int i = 30; i < 33; ++i) {
    scene1.squares.add(new Square(WoodSquare, i*64 + 500, 644, false, 0));
  }
  for (int i = 35; i < 38; ++i) {
    scene1.squares.add(new Square(WoodSquare, i*64 + 500, 772, false, 0));
  }

  //Hill
  for (int i = 46; i < 49; ++i) {
    scene1.squares.add(new Square(DirtSquare, i*64 + 500, 772, false, 0));
  }
  for (int i = 51; i < 54; ++i) {
    scene1.squares.add(new Square(DirtSquare, i*64 + 500, 580, false, 0));
  }
  for (int i = 57; i < 60; ++i) {
    scene1.squares.add(new Square(DirtSquare, i*64 + 500, 452, false, 0));
  }

  //Border
  for (int i = -10; i < 14; ++i) {
    scene1.squares.add(new Square(InvisSquare, 410, i*64-10, false, 0));
  }

  //Transport Border
  for (int i = -10; i < 14; ++i) {
    scene1.squares.add(new Square(InvisSquare, 4700, i*64-10, true, 0));
  }

  //scene1.squares.add(new Square(InvisSquare, 4500, 800, true, 0));

  //SCENE 2

  //Floor
  for (int i = -30; i < 190; ++i) {
    scene2.squares.add(new Square(SnowSquareTop, i*64 + 500, 900, false, 0));
    scene2.squares.add(new Square(SnowSquare, i*64 + 500, 964, false, 0));
    scene2.squares.add(new Square(SnowSquare, i*64 + 500, 1028, false, 0));
  }

  //Platforms
  for (int i = 25; i < 28; ++i) {
    scene2.squares.add(new Square(StoneSquare, i*64 + 500, 772, false, 0));
  }
  for (int i = 30; i < 33; ++i) {
    scene2.squares.add(new Square(StoneSquare, i*64 + 500, 644, false, 0));
  }
  for (int i = 35; i < 38; ++i) {
    scene2.squares.add(new Square(StoneSquare, i*64 + 500, 772, false, 0));
  }

  //Stairs
  for (int i = 55; i < 58; ++i) {
    scene2.squares.add(new Square(SnowSquareTop, i*64 + 500, 772, false, 0));
  }
  for (int i = 59; i < 62; ++i) {
    scene2.squares.add(new Square(SnowSquareTop, i*64 + 500, 580, false, 0));
  }
  for (int i = 63; i < 66; ++i) {
    scene2.squares.add(new Square(SnowSquareTop, i*64 + 500, 452, false, 0));
  }


  //Border
  for (int i = -10; i < 14; ++i) {
    scene2.squares.add(new Square(InvisSquare, 410, i*64-10, false, 0));
  }

  //Transport Border
  for (int i = -10; i < 14; ++i) {
    scene2.squares.add(new Square(InvisSquare, 5000, i*64-10, true, 3));
  }

  //scene2.squares.add(new Square(InvisSquare, 6000, 800, true, 3));

  //SCENE 3
  
  //Floor
  for (int i = -30; i < 190; ++i) {
    scene3.squares.add(new Square(SnowSquareTop, i*64 + 500, 900, false, 0));
    scene3.squares.add(new Square(SnowSquare, i*64 + 500, 964, false, 0));
    scene3.squares.add(new Square(SnowSquare, i*64 + 500, 1028, false, 0));
  }
  //Border
  for (int i = -10; i < 14; ++i) {
    scene3.squares.add(new Square(InvisSquare, 400, i*64+5, false, 0));
  }
  //Transport Border
  for (int i = -10; i < 14; ++i) {
    scene3.squares.add(new Square(InvisSquare, 1850, i*64-10, true, 0));
  }
  //scene3.squares.add(new Square(InvisSquare, 1920, 800, true, 0));



  scene0.g1 = new Ginko(100000, 100000);
  scene1.g1 = new Ginko(400, 100);
  scene2.g1 = new Ginko(500, 100);
  scene3.g1 = new Ginko(600, 100);
}


void setup() {

  file = new SoundFile(this, "MenuThemeSoreFeetC.mp3");
  file.play();

  BgGif = new Gif(this, "MushiBgGif2.gif");
  BgGif.loop();

  BGMenu = loadImage("BGMenu.png");
  BGMenu.resize(1920, 1080);
  BGScene1 = loadImage("ForestBg.png");
  BGScene2 = loadImage("SnowBg.png");
  BGScene3 = loadImage("SnowBg2.png");

  WoodSquare = loadImage("WoodSquare.png");
  StoneSquare = loadImage("StoneSquare.png");
  SnowSquare = loadImage("SnowSquare2.png");
  SnowSquareTop = loadImage("SnowSquare3.png");
  GrassDirtSquare =loadImage("GrassDirtSquare.png");
  DirtSquare =loadImage("DirtSquare.png");
  InvisSquare = loadImage("InvisSquare.png");
  keys = new boolean[128];

  reset_levels();
}

public void settings() {
  //imageMode(CORNER);
  size(1920, 1080);
}

void draw() {


  Scene current_scene = scenes.get(sceneNumber);

  clear();
  if (sceneNumber != 0) {
    image(current_scene.background, -current_scene.g1.pos.x*2 + width/2, 0);
  } else {
    image(current_scene.background, 0, 0);
  }

  if (sceneNumber != 0) {
    file.pause();
  }

  if (current_scene.g1.health <= 0) {
    current_scene.g1.pos.x = 0;
    current_scene.g1.pos.y = 0;
    current_scene.g1.health = 10;
    sceneNumber = 0;
    reset_levels();
  }




  current_scene.g1.velocity.y = current_scene.g1.velocity.y + 1;

  grounded = false;

  current_scene.g1.pos.y += current_scene.g1.velocity.y;



  for (Square square : current_scene.squares) {
    if (checkCollision(current_scene.g1, square)) {

      if (square.is_menu_block == true) {
        println(sceneNumber);
        sceneNumber = square.scene_destination;
        println(sceneNumber);
      }

      if (current_scene.g1.velocity.y > 0) {
        current_scene.g1.pos.y = square.pos.y - current_scene.g1.height;
        grounded = true;
      } else {
        current_scene.g1.pos.y = square.pos.y + square.height;
      }
      current_scene.g1.velocity.y = 0;
    }
  }

  current_scene.g1.pos.x += current_scene.g1.velocity.x;
  for (Square square : current_scene.squares) {
    if (checkCollision(current_scene.g1, square)) {

      if (square.is_menu_block == true) {
        println(sceneNumber);
        sceneNumber = square.scene_destination;
        println(sceneNumber);
      }

      if (current_scene.g1.velocity.x > 0) {
        current_scene.g1.pos.x = square.pos.x - current_scene.g1.width;
      } else {
        current_scene.g1.pos.x = square.pos.x + square.width;
      }
      current_scene.g1.velocity.x = 0;
    }
  }

  for (LevelButton levelbutton : current_scene.levelbuttons) {
    levelbutton.Display();
    boolean button_clicked = levelbutton.check_if_clicked(mouseX, mouseY);
    if (button_clicked) {
      sceneNumber = levelbutton.my_scene_number;
    }
  }


  pushMatrix();
  translate(-current_scene.g1.pos.x + 500, 0);
  for (Square square : current_scene.squares) {
    square.display();
  }

  for (Projectile projectile : current_scene.projectiles) {
    projectile.Update();
    projectile.Display();
  }

  for (Enemy enemy : current_scene.enemies) {
    //Code to execute each frame for every enemy in the current scene

    if (enemy.health > 0) {
      enemy.Display();
      enemy.Update(current_scene.g1.pos);
      if (checkCollision(current_scene.g1, enemy)) {
        current_scene.g1.health -= enemy.damage;
        enemy.health = -1;
      }

      for (Projectile projectile : current_scene.projectiles) {
        if (checkCollision(projectile, enemy)) {
          if (projectile.health > 0) {
            projectile.health = -1;
            enemy.health -= 1;
          }
        }
      }
    }
  }

  current_scene.g1.move();
  current_scene.g1.display();
  popMatrix();
}

void mousePressed() {
  Scene current_scene = scenes.get(sceneNumber);
  pushMatrix();
  translate(-current_scene.g1.pos.x + 500, 0);
  current_scene.projectiles.add(new Projectile(current_scene.g1.pos.x, current_scene.g1.pos.y));
  popMatrix();
}

void keyPressed() {

  Scene current_scene = scenes.get(sceneNumber);




  if (key == 'd') {
    if (current_scene.g1.velocity.x > 6) {
      current_scene.g1.velocity.x = 6;
    }
    if (current_scene.g1.velocity.x <= 4) {
      current_scene.g1.velocity.x = 0;
    }
    current_scene.g1.velocity.x += 4;
  }

  if (key == 'a') {
    if (current_scene.g1.velocity.x < -6) {
      current_scene.g1.velocity.x = -6;
    }
    if (current_scene.g1.velocity.x <= -4) {
      current_scene.g1.velocity.x = 0;
    }
    current_scene.g1.velocity.x -= 4;
  }

  if (key == ' ') {
    if (grounded) {
      current_scene.g1.velocity.y -= 20;
    }
  }
}
