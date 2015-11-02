/**
 * BackPlate.scad
 * 
 * Created by Diego Viejo
 * 2/Nov/2015
 * 
 */

include<commons.scad>

backPlate();

module backPlate()
difference()
{
    union()
    {
      //main body
      hull()
      {
	translate([-22, -shaftDist-20, 0]) cylinder(d=8, h=backPlateHeight);
	translate([22, -shaftDist-20, 0]) cylinder(d=8, h=backPlateHeight);
	translate([-22, shaftDist+2, 0]) cylinder(d=8, h=backPlateHeight);
	translate([22, shaftDist+2, 0]) cylinder(d=8, h=backPlateHeight);
      }
      //servo
      hull()
      {
	translate([-26, shaftDist+6, 0]) cylinder(d=8, h=backPlateHeight+10);
	translate([26, shaftDist+6, 0]) cylinder(d=8, h=backPlateHeight+10);
	translate([-26, shaftDist-10+4.1, 0]) cylinder(d=8, h=backPlateHeight+10);
	translate([26, shaftDist-10+4.1, 0]) cylinder(d=8, h=backPlateHeight+10);
	//translate([-26, shaftDist-10+0.1, 0]) cube([52, 10, backPlateHeight+10]);
      }
      //main shaft
      hull()
      {
	translate([-5, -5, 0]) cylinder(d=4, h=backPlateHeight+14-0.5);
	translate([5, -5, 0]) cylinder(d=4, h=backPlateHeight+14-0.5);
	translate([-5, 5, 0]) cylinder(d=4, h=backPlateHeight+14-0.5);
	translate([5, 5, 0]) cylinder(d=4, h=backPlateHeight+14-0.5);
      }

    }
    
    //servo housing
    translate([-20, shaftDist-10, -1]) cube([40, 20+1, backPlateHeight+14+2]);
    for(i=[-1,1])
      for(j=[-1,1])
      {
	translate([24*i, shaftDist+0.4+j*5.0, -1]) cylinder(d=3.2, h=backPlateHeight+10+2, $fn=30);
      }
    
    //PaP housing
    translate([0, -shaftDist, -1]) cylinder(d=25, h=backPlateHeight+2);
    for(i=[-1, 1])
      for(j=[-1,1])
	translate([i*15.5, -shaftDist+j*15.5, 0])
	{
	  translate([0, 0, -1]) cylinder(d=3.2, h=backPlateHeight+2, $fn=30);
	  translate([0, 0, backPlateHeight-2]) cylinder(d2=6.2, d1=3.2, h=2.1, $fn=30);
	}

    //main shaft
    translate([0, 0, -1]) cylinder(d=5.1, h=backPlateHeight+14 +2);
}