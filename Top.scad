//rim.scad contains all of the funtions for making the parametric rim.
include <rim.scad>
//buil_specifications.scad contains all of the parameters for this build of the ring rap. 
include <Build_specifications.scad>
//Utility_Functions.scad contains some handy generic funcitons, like nuts, bolts, and others
include <Utility_Functions.scad>

module top_assembly(){
	top_pillar_set();
	rim(iso_rim_size,number_of_spokes,rim_shape=cur_rim_shape,spoke_hole_diam=spoke_hole_diameter,number_of_segments=120);
}

module top_pillar_set(){
if(number_of_pillars==2){
		top_pillar_mount(0);
		top_pillar_mount(180);
	}
	if(number_of_pillars==3){
		top_pillar_mount(0);
		top_pillar_mount(90);
		top_pillar_mount(270);	
	}
	if(number_of_pillars==4){
		top_pillar_mount(0);
		top_pillar_mount(90);
		top_pillar_mount(180);	
		top_pillar_mount(270);	
	}
}

module top_pillar_mount(location_angle,bevel_radius=5){
	rotate([0,0,-90])difference(){
		hull(){
			rotate([0,0,90-location_angle])translate([iso_rim_size/2-rim_distance_from_bead_to_inner_circle-pillar_support_wall_thickness-pillar_rod_diameter/2,0,mount_wall_thickness+rim_width/2-length_of_top_support])cylinder(r=pillar_rod_diameter/2+pillar_support_wall_thickness, h=length_of_top_support);
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
		rotate([0,0,90-location_angle])translate([iso_rim_size/2-rim_distance_from_bead_to_inner_circle-pillar_support_wall_thickness-pillar_rod_diameter/2,0,pillar_support_wall_thickness+rim_width/2-pillar_support_wall_thickness-length_of_top_support])cylinder(r=pillar_rod_diameter/2, h=length_of_top_support);
	}
}


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

