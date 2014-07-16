include <rim.scad>
include <Build_specifications.scad>
$fs=1;
$fa=1;


base_legs(45,base_leg_footprint,base_leg_height);
base_legs(135,base_leg_footprint,base_leg_height);
base_legs(225,base_leg_footprint,base_leg_height);
base_legs(315,base_leg_footprint,base_leg_height);
translate([0,0,base_leg_height-rim_width/2])rim(iso_rim_size,number_of_spokes,rim_shape=cur_rim_shape);
module base_legs(location_angle,leg_xy_size,z_height,bevel_radius=10){
	difference(){
			rotate([0,0,location_angle])translate([iso_rim_size/2,0,0])rotate([0,0,45])union(){
			hull(){
				translate([-leg_xy_size/2+bevel_radius,-leg_xy_size/2+bevel_radius,0])cylinder(r=bevel_radius/2,h=z_height*3/4);
				translate([leg_xy_size/2-bevel_radius,-leg_xy_size/2+bevel_radius,0])cylinder(r=bevel_radius/2,h=z_height/2);
				translate([-leg_xy_size/2+bevel_radius,leg_xy_size/2-bevel_radius,0])cylinder(r=bevel_radius/2,h=z_height);
				translate([leg_xy_size/2-bevel_radius,leg_xy_size/2-bevel_radius,0])cylinder(r=bevel_radius/2,h=z_height*3/4);
			}
			hull(){
				translate([-leg_xy_size/2+bevel_radius,-leg_xy_size/2+bevel_radius,0])cylinder(r=bevel_radius/2,h=z_height);
				translate([-leg_xy_size/2+bevel_radius,leg_xy_size/2-bevel_radius,0])cylinder(r=bevel_radius/2,h=z_height);
				translate([leg_xy_size/2-bevel_radius,leg_xy_size/2-bevel_radius,0])cylinder(r=bevel_radius/2,h=z_height);
			}
			
		}
		translate([0,0,z_height-rim_width/2])rim_segment_spoked(iso_rim_size,number_of_spokes,location_angle-15,location_angle+15,rim_shape=cur_rim_shape);
		translate([0,0,z_height-rim_width])difference(){
			cylinder(r=iso_rim_size,h=rim_width);
			cylinder(r=iso_rim_size/2,h=rim_width);
		}
	}
}
