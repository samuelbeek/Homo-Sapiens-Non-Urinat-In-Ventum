class Ventilator {
  PVector pos;
  PVector dimensions;
  float rotation;
  float speed;
  Repeller r;

  Ventilator(PVector _pos, PVector _dimensions, float _rotation, float _speed, Repeller _r) {
    pos = _pos;
    dimensions = _dimensions;
    rotation = _rotation;
    speed = _speed;
    r = _r;
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(rotation+PI/2);
    fill(255);
    rect(0-dimensions.x/2, 0, dimensions.x, dimensions.y); 
    popMatrix();
  }
  
  boolean isOn() {
    if(speed > 0){
      return true;
    }else {
      return false;
    }
  }
  
  void update(){
    r.strength = speed;
//    println(r.strength);
  }
}

