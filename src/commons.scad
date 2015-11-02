/**
 * 
 * ommons.scad
 * 
 * Created by Diego Viejo
 * 28/Oct/2015
 * 
 * Common definitions for pendulum extruder
 * 
 */

anguloRot = 8; 

anguloActual = anguloRot;

pendulumHeight = 6; //4
shaftDist = (42+16)/2+1; //(nema17width + 625zzDiam)/2 + 1;
shaftPos = 15+7.5+0.25;
tipPos = shaftPos-9.72/2;
tipHeight = pendulumHeight+10.4+0.25;
