class ParticleSystem {
  ArrayList<Particle> particles; 
  PVector origin;

  ParticleSystem(PVector _origin) {
    origin = _origin; // Set origin to input origin
    particles = new ArrayList<Particle>(); // Create an arraylist to store the particles
  }

  void addParticle() {
    particles.add(new Particle(random(1, 3), origin)); // Add a new particle with a random size at the origin of
                                                       // the particle system
  }

  void run() {
    ps.origin = new PVector(mouseX, mouseY);
    for (int i = particles.size()-1; i>=0; i--) { // Loop through the arraylist backwards to make sure no objects are missed
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) { // If a particle is dead it is removed from the arraylist
        particles.remove(i);
      }
    }
  }


  void applyForce(PVector force) { // For all the Particles in particles the force is applied
    for (Particle p : particles) { 
      p.applyForce(force);
    }
  }

  void applyRepeller(Repeller r) { // For all the Particles in particles the reppeler force is applied
    for (Particle p : particles) {
      PVector force = r.repel(p);
      p.applyForce(force);
    }
  }
}


