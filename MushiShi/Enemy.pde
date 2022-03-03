class Enemy extends PlayerObject {
  PImage SpiritScorpion;

  PVector vel;
  PVector acc;

  int health = 5;
  int damage = 3;

  Enemy(int posx, int posy) {

    pos = new Vector(posx, posy);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    width = 60;
    height = 60;

    SpiritScorpion = loadImage("Spirit1.png");
  }

  void Display() {

    if (health > 0) {
      image(SpiritScorpion, pos.x, pos.y, width, height);
    }
    //HEALTHBAR
    //fill(220, 20, 60);
    //rect(pos.x, pos.y-50, 80, 20);

    fill(34, 139, 34);
    rect(pos.x, pos.y-50, health*20, 20);
  }

  void Update(Vector player_position) {

    if (health > 0) {
      PVector player_dir = new PVector(player_position.x, player_position.y);

      PVector pvec_pos = new PVector(pos.x, pos.y);
      player_dir.sub(pvec_pos);

      player_dir.normalize();

      acc = player_dir;
      vel.add(acc);
      vel.limit(2);
      pvec_pos.add(vel);

      pos.x = pvec_pos.x;
      pos.y = pvec_pos.y;
    }
  }
}
