/**
 * gears.scad
 * 
 * Gear set for the pendulum extruder
 * 
 * Created by Diego Viejo
 * License GPL 3.0
 * 
 */

use</home/dviejo/Documentos/piezas/MCAD/involute_gears.scad>


difference()
{
    union()
    {
        cylinder(r=12.3, h=10);
        gear (circular_pitch=400,
            number_of_teeth = 9,
            gear_thickness = 20,
            rim_thickness = 20,
            hub_thickness = 20,
            hub_diameter = 10,
            circles=0);
    }
    
    translate([-50, 0, 10/2]) rotate([0, 90, 0]) cylinder(d=2, h=50);
    translate([0, 0, -0.1]) cylinder(d=5.1, h=30, $fn=40);
}

//cylinder(r=16.6667, h=2);

translate([20+10, 0, 0])
{
//    cylinder(r=50, h=2);
    gear (circular_pitch=400,
          number_of_teeth = 18,
	gear_thickness = 10,
	rim_thickness = 10,
	hub_thickness = 20,
        hub_diameter = 20,
	circles=0);
}

