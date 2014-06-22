//class VentilatorSystem
//{
//  PVector origin;
//  Ventilator[] vents;
//  Repeller[] repellers;
//  int distance;
//
//
//  VentilatorSystem(PVector _origin, int _distance)
//  {
//    origin = _origin; // Set origin to input origin
//    distance = _distance;
//    init(); // Initialise hexagon
//  }
//
//  void init()
//  {
//    vents = new Ventilator[6];
////    repellers = new Repeller[6];
//    PVector initialPos = new PVector(0, distance);
//    for (int i = 0; i < 6; i++)
//    {
//      pushMatrix();
//      translate(origin.x, origin.y);
//      vents[i] = new Ventilator(initialPos, new PVector(150, 10));
////      repellers[i] = new Repeller(25, initialPos);
//      initialPos.x += (distance*cos(PI/3));
//      popMatrix();
//    }
//  }
//
//  void display() { // Displays all triangles to make a hexagon
//    pushMatrix();
////    translate(origin.x, origin.y); // Translate to the origin of the hexagon
//
//    for (int i = 0; i < vents.length; i++)
//    {
//      pushMatrix();
////      rotate(PI/3*i); // For every triangle rotate PI/3 around the origin of the hexagon
//      pushMatrix();
////      translate(0, distance);
////      rotate(radians(90));
//      vents[i].display();
////      repellers[i].display();
//      popMatrix();
//      popMatrix();
//    }
//    popMatrix();
//  }
//}
//

