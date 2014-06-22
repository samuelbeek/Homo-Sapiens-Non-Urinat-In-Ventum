class Hexagon
{
  PVector origin;
  Ventilator[] vents;
  Repeller[] repellers;
  int distance;


  Hexagon(PVector _origin, int _distance)
  {
    origin = _origin; // Set origin to input origin
    distance = _distance;
    init(); // Initialise hexagon
  }

  void init()
  {
    vents = new Ventilator[6];
    repellers = new Repeller[6];
    PVector initialPos = new PVector(origin.x+distance, origin.y + distance); //
    for (int i = 0; i < 6; i++)
    {
      initialPos = new PVector(origin.x + distance*cos((PI/3)*i), origin.y + distance*sin((PI/3)*i)); //
      repellers[i] = new Repeller(30, new PVector(initialPos.x, initialPos.y));
      vents[i] = new Ventilator(initialPos, new PVector(200, 10), PI/3*i, 3, repellers[i]);
      fill(0, 255, 0);
    }
  }

  void display() { // Displays all triangles to make a hexagon

    for (int i = 0; i < vents.length; i++)
    {
      vents[i].display();
    }
    
  }
  
  void updateVent(int index, float speed){
      println("updated"+index); 
      vents[index].speed = speed*-500; 
      vents[index].update();
  }
}

