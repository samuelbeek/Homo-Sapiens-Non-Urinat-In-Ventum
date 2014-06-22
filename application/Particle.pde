class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float mass;

  Particle(float m, PVector _location){
    mass = m; // Set mass to input
    location = _location; // Set location to input
    velocity = new PVector(0, 0); // Set initial velocity
    acceleration = new PVector(random(-1,1), random(-1, 1)); // Set initial acceleration
    lifespan = 255; // This variable keeps track of how much life is left in the particle

  }
  
  void run(){
    update();
    render();
  }

  void update(){
    velocity.add(acceleration); // Change velocity by amount of acceleration
    velocity.limit(3); // Limit velocity
    location.add(velocity); // Change location by amount of velocity
    acceleration.mult(0); // Reset acceleration after each cycle
    lifespan -= 2; // Decrease lifespan each cycle
  }
  
  void applyForce(PVector force){
    PVector f = force.get(); // Copy force (this way the force does not change if applied to another object)
    f.div(mass); // Divide force by mass to find the acceleration
    acceleration.add(f); // Add the force to the acceleration
  }
  
  
  void render(){
    imageMode(CENTER); // Set image mode to center
    tint(255, lifespan); // Decrese opacity related to lifespan
    image(smokeTexture, location.x, location.y); // Draw image on particle location
  }
  
  boolean isDead(){ // Check if particle is dead
    if(lifespan < 0.0){ // If the lifespan drops below 0.0 the particle is dead
      return true;
    }else{
      return false;
    }
  }
}
