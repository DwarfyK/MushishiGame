class Scene {

	PImage background;
	ArrayList<Square> squares = new ArrayList<Square>();
	ArrayList<LevelButton> levelbuttons = new ArrayList<LevelButton>();
	ArrayList<Enemy> enemies = new ArrayList<Enemy>();
	ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
	Ginko g1;

	Scene(PImage background_input){
		background = background_input;
	}

}
