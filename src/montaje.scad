/**
 * Fichero de montaje
 * 
 */

anguloRot = 8; 

anguloActual = -anguloRot;

shaftPos = 15+7.5+0.25;
tipPos = shaftPos+9.72/2;

//intersection()
{
*rotate(anguloRot)
{
  translate([-92.0, -92.0, 0]) import("aux/Pendulum_101.STL");

  color("red") translate([-4.25, 0, 11]) rotate(-anguloRot) rotate([90, 0, 0]) cylinder(d=3.3, h=100, $fn=60);
  
  color("red") translate([4.25, 0, 11]) rotate(anguloRot) rotate([90, 0, 0]) cylinder(d=3.3, h=100, $fn=60);
}


  *color("red")
  rotate(17.6725+ anguloRot) 
  {
    hull()
    {
    
      translate([4.8, 33.45, 0]) cylinder(d=9, h=20, $fn=60);
      translate([-4.8, 33.45, 0]) cylinder(d=9, h=20, $fn=60);
    
      translate([1.75, 21.85, 0]) cylinder(d=6, h=20, $fn=60);
      translate([-1.75, 21.85, 0]) cylinder(d=6, h=20, $fn=60);
    }

  }


  //pivoting axle
  color("silver") cylinder(d=5, h=30);
  
  translate([0, -20, 14]) mirror([0, 0, 1]) import("../output/pinion.stl");
  color("silver") translate([0, -20, 0]) cylinder(d=5, h=20);

  rotate(anguloActual)
  {
    rotate(anguloRot) translate([shaftPos, -20, 0]) import("../output/corona.stl");
    rotate(-anguloRot) translate([-shaftPos, -20, 0]) import("../output/corona.stl");
    
    //ejes
    color("silver") 
    {
      rotate(anguloRot) translate([shaftPos, -20, 0]) cylinder(d=5, h=40);
      rotate(-anguloRot) translate([-shaftPos, -20, 0]) cylinder(d=5, h=40);
    }
    
    //filament feeder
    color("green")
    {
      translate([tipPos, 0, 14+3.6+0.25]) rotate(anguloRot) rotate([90, 0, 0]) 
	translate([0, 0, -50])cylinder(d=3.3, h=120, $fn=60);
      translate([-(tipPos), 0, 14+3.6+0.25]) 
	rotate(-anguloRot) rotate([90, 0, 0]) translate([0, 0, -50]) cylinder(d=3.3, h=120, $fn=60);
      echo("Hotend 0 pos: ",tipPos);
      echo("Hotend 1 pos: ",-tipPos);
      echo("Distance between hotends: ",2*tipPos);
    }
  }

}

translate([0, 0, 14+14])
  rotate(anguloActual)
    pendulum();

pendulumHeight = 5; //4
module pendulum()
{
  difference()
  {
    union()
    {

      rotate(17.6725+ anguloRot) 
      {
	hull()
	{
    
	  translate([4.8, 33.45, 0]) cylinder(d=9+10, h=pendulumHeight, $fn=60);
	  translate([-4.8, 33.45, 0]) cylinder(d=9+10, h=pendulumHeight, $fn=60);
    
	  translate([1.75, 21.85, 0]) cylinder(d=6+10, h=pendulumHeight, $fn=60);
	  translate([-1.75, 21.85, 0]) cylinder(d=6+10, h=pendulumHeight, $fn=60);
	}
	
	hull()
	{
	  translate([4.8, 33.45, 0]) cylinder(d=9, h=pendulumHeight, $fn=60);
	  translate([-4.8, 33.45, 0]) cylinder(d=9, h=pendulumHeight, $fn=60);
	  translate([10, 5, 0]) cylinder(d=10, h=pendulumHeight, $fn=60);
	  translate([-10, 10, 0]) cylinder(d=10, h=pendulumHeight, $fn=60);
	}


      }
	hull()
	{
	  rotate(17.6725+ anguloRot) 
	  {
	    translate([10, 5, 0]) cylinder(d=10, h=pendulumHeight, $fn=60);
	    translate([-10, 10, 0]) cylinder(d=10, h=pendulumHeight, $fn=60);
	  }
	  rotate(anguloRot) translate([shaftPos, -20, 0]) cylinder(d=22, h=pendulumHeight, $fn=60);
	  rotate(-anguloRot) translate([-shaftPos, -20, 0]) cylinder(d=22, h=pendulumHeight, $fn=60);
	}
    }
    rotate(17.6725+ anguloRot) 
    {
      hull()
      {
    
	translate([4.8, 33.45, -1]) cylinder(d=9, h=20, $fn=60);
	translate([-4.8, 33.45, -1]) cylinder(d=9, h=20, $fn=60);
    
	translate([1.75, 21.85, -1]) cylinder(d=6, h=20, $fn=60);
	translate([-1.75, 21.85, -1]) cylinder(d=6, h=20, $fn=60);
      }
  
    }
    
    //pivoting bearing
    translate([0, 0, -1]) cylinder(d=13+0.2, h=30); 
    translate([0, 0, pendulumHeight-1.05]) cylinder(d=15+0.2, h=2);
    
    //shaft & bearings
    rotate(anguloRot) translate([shaftPos, -20, -1]) cylinder(d=9, h=100, $fn=60);
    rotate(-anguloRot) translate([-shaftPos, -20, -1]) cylinder(d=9, h=100, $fn=60);

    rotate(anguloRot) translate([shaftPos, -20, -0.5]) cylinder(d=16+0.15, h=5, $fn=60);
    rotate(-anguloRot) translate([-shaftPos, -20, -0.5]) cylinder(d=16+0.15, h=5, $fn=60);
    
  }
}

