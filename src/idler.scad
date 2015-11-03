/**
 * Idler.scad
 * 
 * Created by Diego Viejo 
 * 03/Nov/2015
 * 
 */

include<../../3d-Models/Commons/extruderCommons.scad>
include<commons.scad>

idlerHeight = tipHeight+diam/2+2+0.6 - pendulumHeight;

idler();

module idler()
{
  difference()
  {
    union()
    {
      cylinder(r=5, h=idlerHeight);
      translate([0, -15+correction, 0]) cylinder(r=5, h=idlerHeight);
      translate([-5, -15+correction, 0]) cube([10, 15.5+correction, idlerHeight]);

      rotate(-60) nestedHull()
      {
	translate([-6.5, 0, 0]) cube([6.5, 37, idlerHeight]);
	translate([-2.5, 37, 0]) rotate(30)
		translate([-2.5, 0, 0]) cube([5, 4, idlerHeight]);
	translate([-2.5, 37, 0]) rotate(30)
		translate([0, 7, 0]) cylinder(r = 2.5, h = idlerHeight);
      }
      rotate(-30) translate([0, 0, 0]) cube([5, 10, idlerHeight]);
      cylinder(r=bearingRad+1.5, h=idlerHeight);
      
    }

    //idler attaching hole
    rotate(-9) translate([15.5 - 10 - filament_d+2.5, -15.5, 0])
    {
      translate([0, 0, 5.3 - 1])
	cylinder(r = 2.5/2, h = 3.5);
      translate([0, 0, tipHeight-pendulumHeight + 2.25+0.35])
	cylinder(r = 3.2/2, h = 10);
      translate([0, 0, tipHeight-pendulumHeight + 4.5])
	cylinder(r = 3.2, h = 10);
      // idler bearing, for viewing
      %translate([0, 0, tipHeight-pendulumHeight -4.7/2])
	cylinder(r = 5, h = 4);
    }
//mainHeight/2 + offset es tipHeight-pendulumHeight
    translate([0, 0, tipHeight-pendulumHeight]) {
	//idler bearing main hole
	translate ([0, 0, 0]) rotate(-9) 
	  translate([15.5 - 10 - filament_d+2.5, -15.5, -6.25/2]) //-5.5/2
	    cylinder(r = 6.5, h = 5.4);
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
    #translate([0, 0, idlerHeight / 2 + 5.5]) rotate([90, 0, 30]) translate([31, 0, -2]) cylinder(r = spring_d * 7/12, h = 13, $fn = 6);
    #translate([0, 0, idlerHeight / 2 - 5.5]) rotate([90, 0, 30]) translate([31, 0, -2]) cylinder(r = spring_d * 7/12, h = 13, $fn = 6);
      
    //bearing holes
    translate([0, 0, -0.15]) cylinder(r=bearingRad+0.18, h=bearingHeight+0.4, $fn=30);
    translate([0, 0, idlerHeight - bearingHeight-0.4])
        cylinder(r=bearingRad+0.18, h=bearingHeight+0.5, $fn=30);
      
    //main screew hole
    translate([0, 0, bearingHeight+0.5]) cylinder(r=3, h=40, $fn=15);

      
    difference()
    {
        hull()
	{
	  translate([0, -15.5, -1]) cylinder(r=5.25, h=5);
	  translate([-5.25, -11, -1]) cube([5.25*2, 5.25*2, 5]);
	}
	translate([0, 0, -1.1]) cylinder(r=bearingRad+1.5, h=10);
    }

    difference()
    {
        hull()
	{
	  translate([0, -15.5, idlerHeight-4]) cylinder(r=5.25, h=5);
	  translate([-5.25, -11, idlerHeight-4]) cube([5.25*2, 5.25*2, 5]);
	}
	translate([0, 0, idlerHeight-9.1]) cylinder(r=bearingRad+1.5, h=10);
    }

  }
  //support
  translate([0, -15+correction, 0]) support(h=5);
  difference()
  {
    translate([0, -15+correction, 6.75]) support(h=6.2);
    translate([-10, -15+correction, 6.65]) cube([20, 5, 6.3]);
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