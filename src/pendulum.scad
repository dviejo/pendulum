/**
 * pendulum.scad
 * 
 * created by Diego Viejo
 * 28/Oct/2015
 * 
 * pivoting part for the pendulum extruder. 
 * It is the main part that holds both hotends, trackers and idlers.
 * 
 */

include<../../3d-Models/Commons/extruderCommons.scad>
include<commons.scad>

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
	    translate([-4, 10, 0]) cylinder(d=10, h=pendulumHeight, $fn=60);
	  }
*	  #rotate(anguloRot) translate([shaftPos+12, -5, 0]) cylinder(d=22, h=pendulumHeight, $fn=60);
*	  #rotate(-anguloRot) translate([-shaftPos-12, -5, 0]) cylinder(d=22, h=pendulumHeight, $fn=60);

        rotate(anguloRot) translate([shaftPos+11, -22, 0]) 
            cylinder(d=6, h=pendulumHeight, $fn=60);
        rotate(-anguloRot) translate([-shaftPos-11, -22, 0]) 
            cylinder(d=6, h=pendulumHeight, $fn=60);

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
      hull()
      {
        cylinder(d=17, h=tipHeight+diam/2+2+0.6);
        translate([0, 9, 0]) cylinder(d=6, h=tipHeight+diam/2+2+0.6);
      }
      
      //springs' holder
      hull()
      {
        rotate(anguloRot) translate([shaftPos+14, -6, 0]) 
            cylinder(d=20, h=tipHeight+diam/2+2+0.6, $fn=60);
        rotate(anguloRot) translate([shaftPos+11, -22, 0]) 
            cylinder(d=6, h=tipHeight+diam/2+2+0.6, $fn=60);
      }
      hull()
      {
        rotate(-anguloRot) translate([-shaftPos-14, -5, 0]) 
            cylinder(d=20, h=tipHeight+diam/2+2+0.6, $fn=60);
        rotate(-anguloRot) translate([-shaftPos-11, -22, 0]) 
            cylinder(d=6, h=tipHeight+diam/2+2+0.6, $fn=60);
      }
      
      //guiding filament structure
      rotate(-anguloRot) translate([-shaftPos, -shaftDist-10, 0])
        cube([10, 10, tipHeight+diam/2+2+0.6-6]);
      
      rotate(anguloRot) translate([shaftPos-10, -shaftDist-10, 0])
        cube([10, 10, tipHeight+diam/2+2+0.6-6]);
      
    } //end union
    
    //hole for rotating from servo's arm
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
    
    //extruder mountings
      translate([tipPos, 0, tipHeight]) rotate(anguloRot) 
	rotate([-90, 0, 0]) translate([0, 0, -37]) 
	  extruderMount();
      translate([-tipPos, 0, tipHeight]) rotate(-anguloRot) 
	rotate([-90, 0, 0]) translate([0, 0, -37]) 
	  extruderMount();

      //support for idlers
      #rotate(-anguloRot) 
	translate([-shaftPos+15.5, -shaftDist+15.5-1, -1]) 
	  cylinder(d=3, h=50, $fn=60);
      #rotate(anguloRot) 
	translate([shaftPos-15.5, -shaftDist+15.5-1, -1]) 
	  cylinder(d=3, h=50, $fn=60);

    //Springs side of extruder0
    rotate(-anguloRot)
    {
        translate([-shaftPos-6.5, -15.5+2, -1]) rotate(-30-5.5) 
            translate([-30,0,0]) cube([30, 15, tipHeight+diam/2+2+0.6+2]);
        #translate([-shaftPos-15.5, 0, tipHeight-3]) rotate([90, 0, (150 - 5.5)]) translate([-3.0, 0, -7.5]) 
            cylinder(r = spring_d * 7/12, h = 10, $fn = 6);
        #translate([-shaftPos-15.5, 0, tipHeight+9]) rotate([90, 0, (150 - 5.5)]) translate([-3.0, 0, -7.5]) 
            cylinder(r = spring_d * 7/12, h = 10, $fn = 6);
    }
            
    //Springs side of extruder1
    rotate(anguloRot)
    {
        translate([shaftPos+6.5, -15.5+2, -1]) rotate(30+5.5) cube([30, 20, tipHeight+diam/2+2+0.6+2]);
        #translate([shaftPos+15.5, 0, tipHeight-3]) rotate([90, 0, -(150 - 5.5)]) translate([3.0, 0, -7.5]) 
            cylinder(r = spring_d * 7/12, h = 10, $fn = 6);
        #translate([shaftPos+15.5, 0, tipHeight+9]) rotate([90, 0, -(150 - 5.5)]) translate([3.0, 0, -7.5]) 
            cylinder(r = spring_d * 7/12, h = 10, $fn = 6);
    }
    
    
    //filament guiding holes
    rotate(-anguloRot)
    {
        translate([-shaftPos, -shaftDist, pendulumHeight])
            cylinder(d=10, h=tipHeight+diam/2+2+0.6);
        hull()
        {
            translate([-shaftPos+5+5, -shaftDist, pendulumHeight])
                cylinder(d=10, h=tipHeight+diam/2+2+0.6);
            translate([-shaftPos+15, -shaftDist, pendulumHeight])
                cylinder(d=15, h=tipHeight+diam/2+2+0.6);
        }
    }
    rotate(anguloRot)
    {
        translate([shaftPos, -shaftDist, pendulumHeight])
            cylinder(d=10, h=tipHeight+diam/2+2+0.6);
        hull()
        {
            translate([shaftPos-5-5, -shaftDist, pendulumHeight])
                cylinder(d=10, h=tipHeight+diam/2+2+0.6);
            translate([shaftPos-15, -shaftDist, pendulumHeight])
                cylinder(d=15, h=tipHeight+diam/2+2+0.6);
        }
    }

  }
  

} //end of pendulum module

module pendulumTop()
{
}
