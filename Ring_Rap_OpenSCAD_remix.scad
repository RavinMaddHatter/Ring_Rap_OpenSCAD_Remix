//rim.scad contains all of the funtions for making the parametric rim.
include <rim.scad>
//buil_specifications.scad contains all of the parameters for this build of the ring rap.
include <Build_specifications.scad>
//Utility_Functions.scad contains some handy generic funcitons, like nuts, bolts, and others
include <Utility_Functions.scad>
//Base for Ring_rap is contained in Base.scad
include <Base.scad>
//top for Ring_rap is contained in Top.scad
include <Top.scad>
//gantry for Ring_rap is contained in Base.scad
include <Gantry.scad>
//$fs=1;
//$fa=1;


base();
translate([0,0,pillar_h/2])assembled_gantry();
translate([0,0,pillar_h])top_assembly();

