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

pendulumServoRot = 10.75;
pendulumHeight = 6; //4
shaftDist = (42+16)/2+1; //(nema17width + 625zzDiam)/2 + 1;
shaftPos = 15+7.5+0.25;
tipPos = shaftPos-9.72/2;
tipHeight = pendulumHeight+5; //+10.4+0.25;
tipHeight2Top = 9.75;
pendulumTotalHeight = 22.55;
trackerLength = 7.05; //TODO: Adjust this measurement to your tracker's

backPlateHeight = 5;
servoWidth = 41.5 + 0.5;