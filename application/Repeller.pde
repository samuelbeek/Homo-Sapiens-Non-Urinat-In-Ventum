class Repeller{
  float mass;
  PVector location;
  float strength = 0; // Set strength
  
  Repeller(float _mass, PVector _location){
    mass = _mass; // Set mass to input mass
    location = _location; // Set location to input location
  }
  
  void display(){
    noStroke();
    fill(50);
    ellipse(location.x, location.y, 10, 10); // Draw an ellipse representing the repeller
  }
  
  PVector repel(Particle p){
    PVector dir = PVector.sub(p.location, location); // Draw a vector direction from the repeller towards the particle
    float d = dir.mag(); // Store the magnitude of the direction vector
    dir.normalize(); // Normalise the direction
    float force = 1 * strength / (d*d); // Calculate the right force 
    dir.mult(force); // Multiply direction by force
    return dir; // Return force
  }
  
  void setStrength (float _strength){
    strength = _strength;
  }

}
