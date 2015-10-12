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

gear (circular_pitch=400,
	gear_thickness = 6,
	rim_thickness = 10,
	hub_thickness = 17,
	circles=8);

cylinder(r=14.25, h=2);

translate([50.5+16.5, 0, 0])
{
    cylinder(r=47.75, h=2);
    gear (circular_pitch=400,
          number_of_teeth = 45,
	gear_thickness = 6,
	rim_thickness = 10,
	hub_thickness = 17,
	circles=8);
}

