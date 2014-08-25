//rim.scad contains all of the funtions for making the parametric rim.
include <rim.scad>
//buil_specifications.scad contains all of the parameters for this build of the ring rap.
include <Build_specifications.scad>
//Utility_Functions.scad contains some handy generic funcitons, like nuts, bolts, and others
include <Utility_Functions.scad>
//Base for Ring_rap is contained in Base.scad
include <Base.scad>
$fs=1;
$fa=1;

//these switches determin how the part is displayed in the render window, it is recomended to only have 1 switch on at a time, you may need to zoom in our out depending upon what you have selected.
assembly=true;			//a render of what the current ring rap looks like
print_legs=false;			//4 legs put in a printable arangement, you may want to only do one at a time
test_print_prof=false;	//this is a test piece to check the profile you have chosen against the rim you are using
test_print_diam=false;	//once you have matched the profile of your rim, you now can check to see if the diameter you have chosen matches the rim diameter by printing this piece.
print_pillars=false;		//for pring ready pillars.




if(assembly){
	base();
}

if(print_pillars){
pillar_base_print_ready();
}
if(print_legs){
legs_print_ready();
	}

if (test_print_diam){
	rim_diam_check(iso_rim_size,number_of_spokes,spoke_hole_diam,rim_shape=cur_rim_shape);
}
if (test_print_prof){
	rim_profile_fit_sample(rim_shape=cur_rim_shape);
}