//rim.scad contains all of the funtions for making the parametric rim.
include <rim.scad>
//buil_specifications.scad contains all of the parameters for this build of the ring rap. 
include <Build_specifications.scad>
//Utility_Functions.scad contains some handy generic funcitons, like nuts, bolts, and others
include <Utility_Functions.scad>
//Base for Ring_rap is contained in Base.scad
include <Base.scad>
//gantry for Ring_rap is contained in Base.scad
include <Gantry.scad>

top_brackets(0);

module top_brackets(location_angle,bevel_radius=5){
	difference(){
		hull(){
			rim_segment(iso_rim_size-mount_wall_thickness, number_of_spokes, location_angle-7.5,location_angle+7.5,number_of_segments=5,spoke_hole_diam=2,rim_shape=cur_rim_shape,$fn=15);
			translate([0,0,-mount_wall_thickness])rim_segment(iso_rim_size, number_of_spokes, location_angle-7.5,location_angle+7.5,number_of_segments=5,spoke_hole_diam=2,rim_shape=cur_rim_shape,$fn=15);
		translate([0,0,mount_wall_thickness])rim_segment(iso_rim_size, number_of_spokes, location_angle-7.5,location_angle+7.5,number_of_segments=5,spoke_hole_diam=2,rim_shape=cur_rim_shape,$fn=15);
		rotate([0,0,90-location_angle])translate([iso_rim_size/2-rim_distance_from_bead_to_inner_circle-pillar_support_wall_thickness-pillar_rod_diameter/2,0,0]){
			}
		}
		rim_segment_spoked(iso_rim_size-mount_wall_thickness, number_of_spokes, location_angle-7.5,location_angle+7.5,number_of_segments=5,spoke_hole_diam=2,rim_shape=cur_rim_shape,$fn=15);
		hull(){
			rim_segment(iso_rim_size+rim_distance_from_bead_to_inner_circle/2, number_of_spokes, location_angle-7.5,location_angle+7.5,number_of_segments=5,spoke_hole_diam=2,rim_shape=cur_rim_shape,$fn=15);
			rim_segment(iso_rim_size+rim_distance_from_bead_to_inner_circle/2+2*mount_wall_thickness, number_of_spokes, location_angle-7.5,location_angle+7.5,number_of_segments=5,spoke_hole_diam=2,rim_shape=cur_rim_shape,$fn=15);
		}
	}
}

rim_segment_spoked(iso_rim_size-mount_wall_thickness, number_of_spokes, 0-7.5,0+7.5,number_of_segments=5,spoke_hole_diam=2,rim_shape=cur_rim_shape,$fn=15);