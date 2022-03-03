class Projectile extends PlayerObject{

  PImage SpiritScorpion;

  PVector vel;
  PVector acc;

  int health = 1;

  Projectile(float posx, float posy) {

    pos = new Vector(posx, posy);
    vel = (new PVector(mouseX, mouseY)).sub(new PVector(posx, posy));
	vel.normalize();
	// speed of the projectile
	vel.mult(10);

    width = 60;
    height = 60;

    SpiritScorpion = loadImage("KanjiFear.png");
  }

  void Display() {

    if (health > 0) {
      image(SpiritScorpion, pos.x, pos.y, width, height);
    }
  }

  void Update() {

    if (health > 0) {
	  
	  PVector pvec_pos = new PVector(pos.x, pos.y);
      pvec_pos.add(vel);

      pos.x = pvec_pos.x;
      pos.y = pvec_pos.y;
    }
  }
}
