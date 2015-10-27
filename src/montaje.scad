/**
 * Fichero de montaje
 * 
 */

/**
 * You can get the next two files from https://github.com/dviejo/3d-Models
 */
include<../../3d-Models/Commons/extruderCommons.scad>
include<../../3d-Models/Commons/idler.scad>

use<include/MCAD/stepper.scad>

anguloRot = 8; 

anguloActual = anguloRot;

pendulumHeight = 5; //4
shaftDist = (42+16)/2+1; //(nema17width + 625zzDiam)/2 + 1;
shaftPos = 15+7.5+0.25;
tipPos = shaftPos-9.72/2;
tipHeight = pendulumHeight+10.4+0.25;

  //pivoting axle
  color("silver") translate([0, 0, -30]) cylinder(d=5, h=30+60);

  
  translate([0, -shaftDist, 14]) mirror([0, 0, 1]) import("../output/pinion.stl");
  color("silver") translate([0, -shaftDist, 0]) cylinder(d=5, h=20);
  translate([0, -shaftDist, -4]) mirror([0, 0, 1]) motor();

  rotate(anguloActual)
  {
    rotate(anguloRot) translate([shaftPos, -shaftDist, 0]) import("../output/corona.stl");
    rotate(-anguloRot) translate([-shaftPos, -shaftDist, 0]) import("../output/corona.stl");
    
    //ejes
    color("silver") 
    {
      rotate(anguloRot) translate([shaftPos, -shaftDist, 0]) cylinder(d=5, h=60);
      rotate(-anguloRot) translate([-shaftPos, -shaftDist, 0]) cylinder(d=5, h=60);
    }
    
    //filament feeder
    color("green")
    {
      translate([tipPos, 0, tipHeight+14]) rotate(anguloRot) rotate([90, 0, 0]) 
	translate([0, 0, -50])cylinder(d=3.3, h=120, $fn=60);
      translate([-(tipPos), 0, tipHeight+14]) 
	rotate(-anguloRot) rotate([90, 0, 0]) translate([0, 0, -50]) cylinder(d=3.3, h=120, $fn=60);
      echo("Hotend 0 pos: ",tipPos);
      echo("Hotend 1 pos: ",-tipPos);
      echo("Distance between hotends: ",2*tipPos);
    }
  }


translate([0, 0, 14])
  rotate(anguloActual)
    pendulum();

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
	  #rotate(anguloRot) translate([shaftPos+12, -5, 0]) cylinder(d=22, h=pendulumHeight, $fn=60);
	  #rotate(-anguloRot) translate([-shaftPos-12, -5, 0]) cylinder(d=22, h=pendulumHeight, $fn=60);

	  rotate(anguloRot) translate([shaftPos+6, -45, 0]) cylinder(d=15, h=pendulumHeight, $fn=60);
	  rotate(-anguloRot) translate([-shaftPos-6, -45, 0]) cylinder(d=15, h=pendulumHeight, $fn=60);
	  
	  rotate(anguloRot) translate([shaftPos-8, -48, 0]) cylinder(d=10, h=pendulumHeight, $fn=60);
	  rotate(-anguloRot) translate([-shaftPos+8, -48, 0]) cylinder(d=10, h=pendulumHeight, $fn=60);

      }
      hull()
      {
	  rotate(anguloRot) translate([shaftPos+6, -45, 0]) cylinder(d=15, h=tipHeight+diam/2+2+0.6, $fn=60);
	  rotate(-anguloRot) translate([-shaftPos-6, -45, 0]) cylinder(d=15, h=tipHeight+diam/2+2+0.6, $fn=60);
	  
	  rotate(anguloRot) translate([shaftPos-8, -48, 0]) cylinder(d=10, h=tipHeight+diam/2+2+0.6, $fn=60);
	  rotate(-anguloRot) translate([-shaftPos+8, -48, 0]) cylinder(d=10, h=tipHeight+diam/2+2+0.6, $fn=60);
      }
      
      //pivoting support structure
      cylinder(d=17, h=tipHeight+diam/2+2+0.6);
      
    } //end union
    
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
    
    //pivoting bearing 625zz
    translate([0, 0, -1]) cylinder(d=9, h=50); 
      //lower bearing
    translate([0, 0, -1]) cylinder(d=16+0.2, h=3+1.25); 
//    translate([0, 0, -0.05]) cylinder(d=15+0.2, h=1.1);
    
    //shaft & bearings 625zz
    rotate(anguloRot) translate([shaftPos, -shaftDist, -1]) cylinder(d=9, h=100, $fn=60);
    rotate(-anguloRot) translate([-shaftPos, -shaftDist, -1]) cylinder(d=9, h=100, $fn=60);

    rotate(anguloRot) translate([shaftPos, -shaftDist, -0.5]) cylinder(d=16+0.15, h=5, $fn=60);
    rotate(-anguloRot) translate([-shaftPos, -shaftDist, -0.5]) cylinder(d=16+0.15, h=5, $fn=60);
    
    
    //room for the motor shaft
    for(angle = [-8:7])
    {
      hull()
      {
	rotate(angle) translate([0, -shaftDist, -1]) cylinder(d=5.5, h=pendulumHeight+2); 
	rotate(angle+1) translate([0, -shaftDist, -1]) cylinder(d=5.5, h=pendulumHeight+2); 
      }
    }
    
      translate([tipPos, 0, tipHeight]) rotate(anguloRot) 
	rotate([-90, 0, 0]) translate([0, 0, -35]) 
	  extruderMount();
      translate([-tipPos, 0, tipHeight]) rotate(-anguloRot) 
	rotate([-90, 0, 0]) translate([0, 0, -35]) 
	  extruderMount();

      //support for idlers
      #rotate(-anguloRot) 
	translate([-shaftPos+15.5, -shaftDist+15.5, -1]) 
	  cylinder(d=3, h=50, $fn=60);
      #rotate(anguloRot) 
	translate([shaftPos-15.5, -shaftDist+15.5, -1]) 
	  cylinder(d=3, h=50, $fn=60);
  }
}

    //hotend mount
    rotate(anguloActual)
    {
	  
      //idlers
      rotate(anguloRot)
	translate([shaftPos-15.5, -shaftDist+15.5, tipHeight + 14- (mainHeight/2 + offset -3/2)]) 
	  rotate(7) idler();
      rotate(-anguloRot)
	translate([-shaftPos+15.5, -shaftDist+15.5, tipHeight+ 14 - (mainHeight/2 + offset -3/2)]) 
	  mirror([1,0,0]) rotate(7) idler();
    }
    
