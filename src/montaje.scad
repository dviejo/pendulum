/**
 * Fichero de montaje
 * 
 */

/**
 * You can get the next two files from https://github.com/dviejo/3d-Models
 */
include<../../3d-Models/Commons/extruderCommons.scad>
include<../../3d-Models/Commons/idler.scad>
include<pendulum.scad>
include<commons.scad>

use<include/MCAD/stepper.scad>


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


    //hotend mount
    rotate(anguloActual)
    {
	  
      //idlers
      rotate(anguloRot)
	translate([shaftPos-15.5, -shaftDist+15.5-1, tipHeight + 14- (mainHeight/2 + offset -0.5)]) 
	  rotate(6) idler();
      rotate(-anguloRot)
	translate([-shaftPos+15.5, -shaftDist+15.5-1, tipHeight+ 14 - (mainHeight/2 + offset -0.5)]) 
	  mirror([1,0,0]) rotate(6) idler();
    }
    
