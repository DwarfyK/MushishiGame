
class Vector{
    float x;
    float y;

    Vector(float x_, float y_){
        x = x_;
        y = y_;
    }

    void add(Vector v){
        y = y + v.y;
        x = x + v.x;
    }

    void add(float x_in, float y_in){
        x += x_in;
        y += y_in;
    }

    void sub(Vector v){
        y = y - v.y;
        x = x - v.x;
    }

    void sub(float x_in, float y_in){
        x -= x_in;
        y -= y_in;
    }
}

class PlayerObject{
    Vector pos;
    int width;
    int height;
}

class BrickObject{
    Vector pos;
    int width;
    int height;
}

boolean is_in_interval(float min, float max, float x){
    if(x > min && x < max){
        return true;
    } else {
        return false;
    }
}


boolean checkCollision(PlayerObject obj1, Square obj2){
    if (obj1.pos.x < obj2.pos.x + obj2.width &&
        obj1.pos.x + obj1.width > obj2.pos.x &&
        obj1.pos.y < obj2.pos.y + obj2.height &&
        obj1.pos.y + obj1.height > obj2.pos.y) {
        return true;    
    } else {
        return false;
    }
}

boolean checkCollision(PlayerObject obj1, Enemy obj2){
    if (obj1.pos.x < obj2.pos.x + obj2.width &&
        obj1.pos.x + obj1.width > obj2.pos.x &&
        obj1.pos.y < obj2.pos.y + obj2.height &&
        obj1.pos.y + obj1.height > obj2.pos.y) {
        return true;    
    } else {
        return false;
    }
}

boolean checkCollision(Projectile obj1, Enemy obj2){
    if (obj1.pos.x < obj2.pos.x + obj2.width &&
        obj1.pos.x + obj1.width > obj2.pos.x &&
        obj1.pos.y < obj2.pos.y + obj2.height &&
        obj1.pos.y + obj1.height > obj2.pos.y) {
        return true;    
    } else {
        return false;
    }
}
