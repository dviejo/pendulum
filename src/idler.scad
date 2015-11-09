/**
 * Idler.scad
 * 
 * Created by Diego Viejo 
 * 03/Nov/2015
 * 
 */

include<../../3d-Models/Commons/extruderCommons.scad>
include<commons.scad>

idlerHeight = pendulumTotalHeight - pendulumHeight; 
holgura = 1; //0.5mm for each side
secondArmLength = 13;

//idler();

//translate([-20, 0, 0]) mirror([1, 0, 0])
//idler();

module idler()
translate([0, 0, idlerHeight]) mirror([0, 0, 1])  //para visualización
{
  difference()
  {
    union()
    {
      cylinder(r=5, h=idlerHeight-holgura);
      translate([0, -secondArmLength, 0]) cylinder(r=5, h=idlerHeight-holgura);
      translate([-5, -secondArmLength, 0]) cube([10, secondArmLength+0.5, idlerHeight-holgura]);

      rotate(-60) nestedHull()
      {
	translate([-6.5, 0, 0]) cube([6.5, 37, idlerHeight-holgura]);
	translate([-6.5, 23, 0]) cube([6.5, 14, idlerHeight-holgura]);
	translate([-6.5, 23, 0]) cube([6.5, 14, idlerHeight+pendulumHeight]);
	translate([-2.5, 37, 0]) rotate(30)
		translate([-2.5, 0, 0]) 
		  cube([5, 4, idlerHeight+pendulumHeight]);
	translate([-2.5, 37, 0]) rotate(30)
		translate([0, 7, 0]) 
		  cylinder(r = 2.5, h = idlerHeight+pendulumHeight);
      }
      rotate(-30) translate([0, 0, 0]) cube([5, 10, idlerHeight-holgura]);
      cylinder(r=bearingRad+1.5, h=idlerHeight-holgura);
      
    }

    //idler attaching hole
    *rotate(-9) 
      translate([15.5-10-filament_d+1.5, -secondArmLength-0.5, 5.5])
	#cylinder(d = 3.2, h = 4);
    rotate(-9) 
      translate([15.5-10-filament_d+1.5, -secondArmLength-0.5, idlerHeight+pendulumHeight-tipHeight-holgura/2])
      {
	//idler bearing main hole for 623zz
	translate([0, 0, -6/2]) 
	    cylinder(r = 6.5, h = 6);
	translate([0, 0, -6+holgura/2+0.3]) 
	  cylinder(d = 3.2, h = 4);
	translate([0, 0, 3+0.3])
	  cylinder(d = 2.75, h = 10);
	*translate([0, 0, 4.5])
	  cylinder(r = 3.2, h = 10);
	// idler bearing, for viewing
	%translate([0, 0, -4.0/2])
	  cylinder(r = 5, h = 4);
    }

    translate([0, 0, idlerHeight+pendulumHeight - tipHeight+holgura/2]) {
	//filament through hole
	hull()
	{
	  translate([12, 21, -1]) 
		rotate([90, 0, -6]) 
		  cylinder(r = tubeRad+1, h = 27);
	  translate([-3, -2, -1]) 
		rotate([90, 0, -12]) translate([15, 0, -15.5]) 
		  cylinder(r = tubeRad+1, h = 20, center = true);
	}
    }

    //spring holes
    #translate([0, 0, idlerHeight+pendulumHeight-tipHeight-holgura/2 + 5.75]) 
      rotate([90, 0, 30]) 
	translate([31, 0, -2]) 
	  cylinder(r = spring_d * 7/12, h = 13, $fn = 6);
    #translate([0, 0, idlerHeight+pendulumHeight-tipHeight-holgura/2 - 5.75]) 
      rotate([90, 0, 30]) 
	translate([31, 0, -2]) 
	  cylinder(r = spring_d * 7/12, h = 13, $fn = 6);
      
    //bearing holes
    translate([0, 0, -0.1]) cylinder(r=bearingRad+0.17, h=bearingHeight+0.45+0.1, $fn=30);
    translate([0, 0, idlerHeight - bearingHeight-0.45])
        cylinder(r=bearingRad+0.17, h=bearingHeight+0.5, $fn=30);
      
    //main screew hole
    translate([0, 0, bearingHeight+0.5]) cylinder(r=3, h=40, $fn=15);

      
    difference()
    {
        hull()
	{
	  translate([0, -secondArmLength-0.5, -1]) cylinder(r=5.25, h=idlerHeight+pendulumHeight - tipHeight-5);
	  translate([-5.25, -11, -1]) cube([5.25*2, 5.25*2, idlerHeight+pendulumHeight - tipHeight-5]);
	}
	translate([0, 0, -1.1]) cylinder(r=bearingRad+1.5, h=idlerHeight);
    }

    *difference()
    {
        hull()
	{
	  translate([0, -secondArmLength-0.5, idlerHeight-4]) cylinder(r=5.25, h=5);
	  translate([-5.25, -11, idlerHeight-4]) cube([5.25*2, 5.25*2, 5]);
	}
	translate([0, 0, idlerHeight-9.1]) cylinder(r=bearingRad+1.5, h=10);
    }

  }
  //support
  translate([0, -secondArmLength, 0]) support(h=idlerHeight+pendulumHeight-tipHeight-5);
  difference()
  {
    translate([0, -secondArmLength, idlerHeight+pendulumHeight-tipHeight- 7.1/2]) support(h=6.75);
    translate([-10, -secondArmLength, idlerHeight+pendulumHeight-tipHeight-7/2]) cube([20, 5, 7]);
  }

    
}


module support(h=5, r=5, n=1)
{
  for(i = [1:n])
  {
    translate([2*r*(i-1), 0, 0])
    {
      difference()
      {
	cylinder(r=r, h=h);
	translate([0, 0, -1]) cylinder(r=r-0.4, h=2+h);
      }
    }
  }
}