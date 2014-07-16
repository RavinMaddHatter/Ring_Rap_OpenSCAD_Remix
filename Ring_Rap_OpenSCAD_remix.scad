include <rim.scad>
include <Build_specifications.scad>
$fs=1;
$fa=1;
assembly=true;
print_legs=false;

//module pillar_legs(){
///pillar_diameterl;
//}

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
		translate([0,0,z_height-rim_width/2])rim_segment_spoked(iso_rim_size,number_of_spokes,location_angle-15,location_angle+15,spoke_hole_diam=spoke_hole_diameter,rim_shape=cur_rim_shape);
		translate([0,0,z_height-rim_width])difference(){
			cylinder(r=iso_rim_size,h=rim_width);
			cylinder(r=iso_rim_size/2,h=rim_width);
		}
	}
}




if(assembly){
	base_legs(45,base_leg_footprint,base_leg_height);
	base_legs(135,base_leg_footprint,base_leg_height);
	base_legs(225,base_leg_footprint,base_leg_height);
	base_legs(315,base_leg_footprint,base_leg_height);
	translate([0,0,base_leg_height-rim_width/2])rim(iso_rim_size,number_of_spokes,rim_shape=cur_rim_shape,spoke_hole_diam=spoke_hole_diameter);
}
if(print_legs){
//LEG 1
	translate([(base_leg_footprint/2+5),(base_leg_footprint/2+5),0])rotate([0,0,-45])translate([-iso_rim_size/2,0,0])rotate([0,0,-45])base_legs(45,base_leg_footprint,base_leg_height);
//LEG 2
	translate([-(base_leg_footprint/2+5),(base_leg_footprint/2+5),0])rotate([0,0,-45])translate([-iso_rim_size/2,0,0])rotate([0,0,-135])base_legs(135,base_leg_footprint,base_leg_height);
//LEG 3
	translate([(base_leg_footprint/2+5),-(base_leg_footprint/2+5),0])rotate([0,0,-45])translate([-iso_rim_size/2,0,0])rotate([0,0,-225])base_legs(225,base_leg_footprint,base_leg_height);
//LEG 4
	translate([-(base_leg_footprint/2+5),-(base_leg_footprint/2+5),0])rotate([0,0,-45])translate([-iso_rim_size/2,0,0])rotate([0,0,-315])base_legs(315,base_leg_footprint,base_leg_height);
}