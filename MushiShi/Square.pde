class Square extends PlayerObject {
    PImage blockImage;

    boolean is_menu_block = false;
    int scene_destination;

    Square(PImage image, float posX, float posY, boolean is_menu_block_input, int scene_destination_in){
        // we expect the image provided will be 64x64
        blockImage = image;
        width = 64;
        height = 64;
        pos = new Vector(posX, posY);
        is_menu_block = is_menu_block_input;
        scene_destination = scene_destination_in;
    }

    void display(){
        image(blockImage, pos.x, pos.y, width, height);
    }

}
