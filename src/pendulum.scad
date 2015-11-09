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

//pendulum();

//uncomment one of the following two and the third line
//translate([0,0,pendulumTotalHeight+pendulumHeight]) rotate([0,180,0]) //for viewing
//translate([0,-80,0]) //for printing
//pendulumTop();

module pendulum()
{
  difference()
  {
    union()
    {

      rotate(pendulumServoRot+ anguloRot) 
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
	  rotate(pendulumServoRot+ anguloRot) 
	  {
	    translate([10, 5, 0]) cylinder(d=10, h=pendulumHeight, $fn=60);
	    translate([-4, 10, 0]) cylinder(d=10, h=pendulumHeight, $fn=60);
	  }

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
	  rotate(anguloRot) translate([shaftPos+6, -45, 0]) cylinder(d=15, h=tipHeight+tipHeight2Top, $fn=60);
	  rotate(-anguloRot) translate([-shaftPos-6, -45, 0]) cylinder(d=15, h=tipHeight+tipHeight2Top, $fn=60);
	  
	  rotate(anguloRot) translate([shaftPos-8, -48, 0]) cylinder(d=10, h=tipHeight+tipHeight2Top, $fn=60);
	  rotate(-anguloRot) translate([-shaftPos+8, -48, 0]) cylinder(d=10, h=tipHeight+tipHeight2Top, $fn=60);
      }
      
      //pivoting support structure
      hull()
      {
        cylinder(d=17, h=pendulumTotalHeight);
        translate([0, 11, 0]) cylinder(d=11, h=pendulumTotalHeight, $fn=6);
      }

      //springs' holder
      hull()
      {
        rotate(anguloRot) translate([shaftPos+14, -6, 0]) 
            cylinder(d=20, h=pendulumTotalHeight, $fn=60);
        rotate(anguloRot) translate([shaftPos+11, -22, 0]) 
            cylinder(d=8, h=pendulumTotalHeight, $fn=60);
      }
      hull()
      {
        rotate(-anguloRot) translate([-shaftPos-14, -5, 0]) 
            cylinder(d=20, h=pendulumTotalHeight, $fn=60);
        rotate(-anguloRot) translate([-shaftPos-11, -22, 0]) 
            cylinder(d=8, h=pendulumTotalHeight, $fn=60);
      }
      
      //guiding filament structure
      rotate(-anguloRot) translate([-shaftPos, -shaftDist-10, 0])
        cube([10, 10, tipHeight+trackerLength]);
      
      rotate(anguloRot) translate([shaftPos-10, -shaftDist-10, 0])
        cube([10, 10, tipHeight+trackerLength]);
      
    } //end union
    
    //hole for rotating from servo's arm
    rotate(pendulumServoRot+ anguloRot) 
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
    translate([0, 0, 5.6+0.3]) cylinder(d=9.2, h=50); 
    translate([0, 0, -1]) cylinder(d=16+0.2, h=5.6+1); 
    
    //shaft & bearings 625zz
    rotate(anguloRot) translate([shaftPos, -shaftDist, 5.6+0.3]) cylinder(d=9, h=100, $fn=60);
    rotate(-anguloRot) translate([-shaftPos, -shaftDist, 5.6+0.3]) cylinder(d=9, h=100, $fn=60);

    rotate(anguloRot) translate([shaftPos, -shaftDist, -1]) cylinder(d=16+0.15, h=5.6+1, $fn=60);
    rotate(-anguloRot) translate([-shaftPos, -shaftDist, -1]) cylinder(d=16+0.15, h=5.6+1, $fn=60);
    
    
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
      rotate(-anguloRot) 
	translate([-shaftPos+15.5, -shaftDist+15.5-1, -1])
	{
	  translate([0, 0, 5+0.3]) cylinder(d=3, h=50, $fn=60);
	  cylinder(d=6.2, h=5, $fn=6);
	}
      rotate(anguloRot) 
	translate([shaftPos-15.5, -shaftDist+15.5-1, -1]) 
	{
	  translate([0, 0, 5+0.3]) cylinder(d=3, h=50, $fn=60);
	  cylinder(d=6.2, h=5, $fn=6);
	}

    //Springs are now at 11.5 mm of distance from both centers
    //Springs side of extruder0
    rotate(-anguloRot)
    {
        translate([-shaftPos-6.5, -15.5+2, -1]) rotate(-30-5.5) 
            translate([-31,0,0]) cube([30, 15, pendulumTotalHeight+2]);
        translate([-shaftPos-6.5, -15.5+2, pendulumHeight]) rotate(-30-5.5) 
            translate([-27,0,0]) cube([30, 15, pendulumTotalHeight+2]);
        #translate([-shaftPos-15.5, 0, tipHeight-5.75]) rotate([90, 0, (150 - 5.5)]) translate([-3.0, 0, -7.5]) 
            cylinder(r = spring_d * 7/12, h = 10, $fn = 6);
        #translate([-shaftPos-15.5, 0, tipHeight+5.75]) rotate([90, 0, (150 - 5.5)]) translate([-3.0, 0, -7.5]) 
            cylinder(r = spring_d * 7/12, h = 10, $fn = 6);
    }
            
    //Springs side of extruder1
    rotate(anguloRot)
    {
        translate([shaftPos+6.5, -15.5+2, -1]) rotate(30+5.5) 
            translate([1, 0, 0]) cube([30, 20, pendulumTotalHeight+2]);
        translate([shaftPos+6.5, -15.5+2, pendulumHeight]) rotate(30+5.5) 
            translate([-5, 0, 0]) cube([30, 20, pendulumTotalHeight+2]);
        #translate([shaftPos+15.5, 0, tipHeight-5.75]) rotate([90, 0, -(150 - 5.5)]) translate([3.0, 0, -7.5]) 
            cylinder(r = spring_d * 7/12, h = 10, $fn = 6);
        #translate([shaftPos+15.5, 0, tipHeight+5.75]) rotate([90, 0, -(150 - 5.5)]) translate([3.0, 0, -7.5]) 
            cylinder(r = spring_d * 7/12, h = 10, $fn = 6);
    }
    
    
    //filament guiding holes
    rotate(-anguloRot)
    {
        translate([-shaftPos, -shaftDist, pendulumHeight])
            cylinder(d=10.2, h=pendulumTotalHeight+2);
        hull()
        {
            translate([-shaftPos+5+5, -shaftDist, pendulumHeight])
                cylinder(d=10.2, h=pendulumTotalHeight+2);
            translate([-shaftPos+15, -shaftDist, pendulumHeight])
                cylinder(d=15, h=pendulumTotalHeight+2);
        }
    }
    rotate(anguloRot)
    {
        translate([shaftPos, -shaftDist, pendulumHeight])
            cylinder(d=10.2, h=pendulumTotalHeight);
        hull()
        {
            translate([shaftPos-5-5, -shaftDist, pendulumHeight])
                cylinder(d=10.2, h=pendulumTotalHeight);
            translate([shaftPos-15, -shaftDist, pendulumHeight])
                cylinder(d=15, h=pendulumTotalHeight);
        }
    }
    
    //conecting holes
    translate([0, 11, -1]) cylinder(d=3.1, h=pendulumTotalHeight+1-3, $fn=60);
    translate([0, 11, pendulumTotalHeight-3+0.3]) cylinder(d=3.1, h=10, $fn=60);
    
    rotate(anguloRot) translate([shaftPos+11, -22, -1]) 
            cylinder(d=3.1, h=pendulumTotalHeight+1-3, $fn=60);
    rotate(anguloRot) translate([shaftPos+11, -22, pendulumTotalHeight-3+0.3]) 
            cylinder(d=3.1, h=10, $fn=60);
	    
    rotate(-anguloRot) translate([-shaftPos-11, -22, -1]) 
            cylinder(d=3.1, h=pendulumTotalHeight+1-3, $fn=60);
    rotate(-anguloRot) translate([-shaftPos-11, -22, pendulumTotalHeight-3+0.3]) 
            cylinder(d=3.1, h=10, $fn=60);
    //connecting nuts
    hull()
    {
        translate([0, 11, pendulumTotalHeight-6]) rotate(90/3) cylinder(d=6.3, h=3, $fn=6);
        translate([0, 22, pendulumTotalHeight-6]) rotate(90/3) cylinder(d=7.0, h=3, $fn=6);
    }
    hull()
    {
        rotate(anguloRot) translate([shaftPos+11, -22, pendulumTotalHeight-6]) 
            rotate(-10) cylinder(d=6.3, h=3, $fn=6);
        rotate(anguloRot) translate([shaftPos+21, -23, pendulumTotalHeight-6]) 
            rotate(-10) cylinder(d=7, h=3, $fn=6);
    }
    hull()
    {
        rotate(-anguloRot) translate([-shaftPos-11, -22, pendulumTotalHeight-6]) 
            rotate(10) cylinder(d=6.3, h=3, $fn=6);
        rotate(-anguloRot) translate([-shaftPos-21, -23, pendulumTotalHeight-6]) 
            rotate(10) cylinder(d=7.0, h=3, $fn=6);
    }
  }
  

} //end of pendulum module

module pendulumTop()
difference() 
{
    union()
    {
        hull()
        {
            rotate(anguloRot) translate([shaftPos+11, -22, 0]) 
                cylinder(d=6, h=pendulumHeight, $fn=60);
            rotate(-anguloRot) translate([-shaftPos-11, -22, 0]) 
                cylinder(d=6, h=pendulumHeight, $fn=60);

            rotate(anguloRot) translate([shaftPos+6, -45, 0]) cylinder(d=15, h=pendulumHeight, $fn=60);
            rotate(-anguloRot) translate([-shaftPos-6, -45, 0]) cylinder(d=15, h=pendulumHeight, $fn=60);
	  
            rotate(anguloRot) translate([shaftPos-8, -48, 0]) cylinder(d=10, h=pendulumHeight, $fn=60);
            rotate(-anguloRot) translate([-shaftPos+8, -48, 0]) cylinder(d=10, h=pendulumHeight, $fn=60);
            translate([0, 11, 0]) cylinder(d=11, h=pendulumHeight);
        }
        
        //extruder mountings
        for(i=[-1,1]) difference()
        {
          translate([i*tipPos, 0, pendulumTotalHeight-tipHeight-tipHeight2Top-1]) 
            rotate(i*anguloRot) 
                rotate([-90, 0, 0]) 
                    translate([0, -17.35, -37]) 
                    {
                        extruderMountB();
                        #translate([-35/2, 14.75, -(height1+height2+mountB_H3)]) cube([35, 3.35, height1+height2+mountB_H3]);
                    }
        }

    } //union end

    
    //middle openning
    translate([0, -30, -1]) cylinder(d=28, h=pendulumHeight+20);
    
    //pivoting bearing 625zz
    translate([0, 0, 5.6+0.3]) cylinder(d=9, h=50); 
    translate([0, 0, -1]) cylinder(d=16+0.15, h=5.6+1); 
    
    //shaft & bearings 625zz
    rotate(anguloRot) translate([shaftPos, -shaftDist, 5.6+0.3]) cylinder(d=9, h=100, $fn=60);
    rotate(-anguloRot) translate([-shaftPos, -shaftDist, 5.6+0.3]) cylinder(d=9, h=100, $fn=60);

    rotate(anguloRot) translate([shaftPos, -shaftDist, -1]) cylinder(d=16+0.15, h=5.6+1, $fn=60);
    rotate(-anguloRot) translate([-shaftPos, -shaftDist, -1]) cylinder(d=16+0.15, h=5.6+1, $fn=60);

    //support for idlers
    rotate(-anguloRot) 
        translate([-shaftPos+15.5, -shaftDist+15.5-1, -1]) 
	  cylinder(d=3, h=50, $fn=60);
    rotate(anguloRot) 
	translate([shaftPos-15.5, -shaftDist+15.5-1, -1]) 
	  cylinder(d=3, h=50, $fn=60);
    
    //connecting holes
    translate([0, 11, -1]) cylinder(d=3.1, h=pendulumHeight+2, $fn=60);
    rotate(anguloRot) translate([shaftPos+11, -22, -1]) 
            cylinder(d=3.1, h=pendulumHeight+2, $fn=60);
    rotate(-anguloRot) translate([-shaftPos-11, -22, -1]) 
            cylinder(d=3.1, h=pendulumHeight+2, $fn=60);
    //connecting for extruders
    #for(i=[1, -1]) for(j=[-1, 1]) translate([j*tipPos, 0, 0]) 
    rotate(j*anguloRot) 
    {

            rotate([-90, 0, 0]) 
                translate([i*(diam2/2 + 7), 25-17.35, -(height1+height2+mountB_H3)+mountB_H3+height2/2-37])
                    rotate([90, 0, 0]) 
                        cylinder(d=3.1, h=pendulumHeight+20, $fn=30);
    }
    
}
