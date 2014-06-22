import processing.serial.*;
import cc.arduino.*;

Arduino arduino;
WindData windData;
Hexagon hexagon;
Ventilator vent;
ParticleSystem ps;
PImage smokeTexture;

void setup() {
  size(1430, 850);
  //println(Arduino.list()); // lists available 
  //arduino = new Arduino(this, Arduino.list()[0], 57600); // 
  //arduino.pinMode(//pinIndex, Arduino.OUTPUT); // Sets arduino pin at index to output



  windData = new WindData("http://samuelbeek.com/antipode/antipode.php");
  //windData.getData();
  ps = new ParticleSystem(new PVector(width/2, height/2)); // Create particle system
  smokeTexture = loadImage("texture.png"); // Load texture for particles
  frameRate(60);

  hexagon = new Hexagon(new PVector(width/2, height/2), 300);
  windData.getAngle();
  setVent();
}

void draw() {
  background(#020143);
  hexagon.display();

  int m = millis();


  if (m % 2 == 0) {
    ps.addParticle(); // Add a new particle every frame
  }

  for (int i = 0; i < hexagon.vents.length; i++) {
    ps.applyRepeller(hexagon.repellers[i]);
  }
  ps.run();
  //  println(frameRate);
  cursor(CROSS);

  if (m % 250 == 0) {
    //    print(m);
    windData.getData();
    //    println(windData.getSpeed());
  }
}

void setVent() {
  float angle = windData.getAngle();
  float speed = windData.getSpeed();
  float a;
  float b;
  float alpha;
  float beta;
  if (angle > 0 && angle < 60) {
    alpha = angle; 
    //calculate the beta corner
    beta = 60 - alpha; 
    //set the correct speed for the fans. 
    a = speed*sin(alpha);
    b = speed*sin(beta); 

    hexagon.updateVent(5, a);
    hexagon.updateVent(4, b);
  } 
  else if (angle > 60 && angle < 120) {
    alpha = angle - 60; 

    //calculate the beta corner
    beta = 60 - alpha; 

    //set the correct speed for the fans. 
    a = speed*sin(alpha);
    b = speed*sin(beta); 

    //connect the a and b values to the correct fans here.
    hexagon.updateVent(5, a);
    println("tussen 0 en 60");
    hexagon.updateVent(0, b);
  }
  else if (angle > 120 && angle < 180) {
    alpha = angle - 120; 


    //calculate the beta corner
    beta = 60 - alpha; 

    //set the correct speed for the fans. 
    a = speed*sin(alpha);
    b = speed*sin(beta); 
    //connect the a and b values to the correct fans here.
    hexagon.updateVent(0, a);
    hexagon.updateVent(1, b);
  }
  else if (angle > 180 && angle < 240) {
    alpha = angle - 180;

    //calculate the beta corner
    beta = 60 - alpha; 

    //set the correct speed for the fans. 
    a = speed*sin(alpha);
    b = speed*sin(beta); 
    //connect the a and b values to the correct fans here.
    hexagon.updateVent(2, a);
    hexagon.updateVent(3, b);
  }
  else if (angle > 240 && angle < 280) {
    alpha = angle - 240;

    //calculate the beta corner
    beta = 60 - alpha; 

    //set the correct speed for the fans. 
    a = speed*sin(alpha);
    b = speed*sin(beta); 
    //connect the a and b values to the correct fans here.
    hexagon.updateVent(4, a);
    hexagon.updateVent(5, b);
  } 
  else {
    alpha = angle - 300;

    //calculate the beta corner
    beta = 60 - alpha; 

    //set the correct speed for the fans. 
    a = speed*sin(alpha);
    b = speed*sin(beta); 

    //connect the a and b values to the correct fans here.
    hexagon.updateVent(5, a);
    hexagon.updateVent(0, b);
    println("else");


    //set the correct speed for the fans. 
    a = speed*sin(alpha);
    b = speed*sin(beta); 

    //connect the a and b values to the correct fans here.
  }

  //print the speeds & angle 
  println("s" + speed);
  println(angle); 
  println("a is " + a);
  println("b is " + b);
}

