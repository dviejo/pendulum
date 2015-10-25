/**
 * gears.scad
 * 
 * Gear set for the pendulum extruder
 * 
 * Created by Diego Viejo
 * License GPL 3.0
 * 
 */

use<include/MCAD/involute_gears.scad>


// piñon del motor. Radio = 10
*difference()
{
    union()
    {
        cylinder(r=9.25, h=7);
        gear (circular_pitch=300,
            number_of_teeth = 9,
            gear_thickness = 7+7,
            rim_thickness = 7+7,
            hub_thickness = 7+7,
            hub_diameter = 10,
	    bore_diameter = 5.25,
            circles=0);
    }
    
    translate([-50, 0, 6.6/2]) rotate([0, 90, 0]) cylinder(d=3.1, h=50);
    hull()
    {
      #translate([-6.5, 0, 6.6/2+0.3]) rotate([0, 90, 0]) cylinder(d=6.4, h=2.8, $fn=6);
      translate([-6.5, 0, -50]) rotate([0, 90, 0]) cylinder(d=6.4, h=2.8, $fn=6);
    }
    translate([0, 0, -0.1]) cylinder(d=5.25, h=30, $fn=40);
}


//Corona. Radio = 30
alturaCorona = 6+7;
//translate([40+10, 0, 0])
difference()
{
    gear (circular_pitch=300,
	number_of_teeth = 18,
	gear_thickness = 6,
	rim_thickness = 6,
	hub_thickness = alturaCorona,
        hub_diameter = 20,
	bore_diameter = 5.25,
	circles=0);

    translate([-25, 0, alturaCorona-6.6/2]) rotate([0, 90, 0]) cylinder(d=3.1, h=50);
    hull()
    {
      #translate([-6.5, 0, alturaCorona-6.6/2-0.3]) rotate([0, 90, 0]) cylinder(d=6.4, h=2.8, $fn=6);
      translate([-6.5, 0, 50]) rotate([0, 90, 0]) cylinder(d=6.4, h=2.8, $fn=6);
    }
    translate([0, 0, -0.1]) cylinder(d=5.25, h=30, $fn=40);
}

