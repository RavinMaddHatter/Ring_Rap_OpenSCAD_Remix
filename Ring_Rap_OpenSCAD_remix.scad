//rim.scad contains all of the funtions for making the parametric rim.
include <rim.scad>
//buil_specifications.scad contains all of the parameters for this build of the ring rap.
include <Build_specifications.scad>
$fs=1;
$fa=1;
assembly=false;
print_legs=false;


base_legs(145,base_leg_footprint,base_leg_height);
//This module is base parts for the Z pillar
module pillar_legs(location_angle,bevel_radius=5){
	// this difference will be used for the rim and Nema motor
	difference(){
		//this rotation, translation, and difference are for the pillar mount
		rotate([0,0,location_angle])translate([iso_rim_size/2-rim_distance_from_bead_to_inner_circle-pillar_support_wall_thickness-pillar_rod_diameter/2,0,0])difference(){
			//this union attaches the pillar mount to the nema block
			union(){
				//this hull makes the smoothed pillar block
				hull(){
					//pillar holder
					cylinder(r=pillar_rod_diameter/2+pillar_support_wall_thickness, h=length_of_pillar_support);
					//the next two lines make the transition between the block and the pillar smoother
					translate([0,-pillar_y/2,0])cylinder(r=bevel_radius,h=base_leg_height);
					translate([0,+pillar_y/2,0])cylinder(r=bevel_radius,h=base_leg_height);
				}
				//this hull is for the nema block and the rim mount
				hull(){
					//these are 2 cylinders that provide the most extreme edges of the nema cut out.
					translate([2*pillar_support_wall_thickness+overall_rim_thickness+nema_motor_box_size,-nema_motor_box_size/2,0])cylinder(r=bevel_radius,h=base_leg_height-rim_width*1.5);
					translate([2*pillar_support_wall_thickness+overall_rim_thickness+nema_motor_box_size,nema_motor_box_size/2,0])cylinder(r=bevel_radius,h=base_leg_height-rim_width*1.5);
					//these are duplicate cylinders for joining the pillar to the nema block
					translate([0,-pillar_y/2,0])cylinder(r=bevel_radius,h=base_leg_height);
					translate([0,+pillar_y/2,0])cylinder(r=bevel_radius,h=base_leg_height);
				}
			}
			translate([0,0,pillar_support_wall_thickness])cylinder(r=pillar_rod_diameter/2, h=length_of_pillar_support);
			translate([2*pillar_support_wall_thickness+bevel_radius+overall_rim_thickness,-nema_motor_box_size/2,pillar_support_wall_thickness])cube([nema_motor_box_size,nema_motor_box_size,base_leg_height]);
		}
		translate([0,0,base_leg_height-rim_width/2])rim_segment_spoked(iso_rim_size,number_of_spokes,90+location_angle-15,90+location_angle+15,spoke_hole_diam=spoke_hole_diameter,rim_shape=cur_rim_shape);
		translate([0,0,base_leg_height-rim_width])difference(){
			cylinder(r=iso_rim_size,h=rim_width,$fa=1,$fs=10);
			cylinder(r=iso_rim_size/2,h=rim_width,$fa=1,$fs=10);
		}
	}
}

//this module is used to draw the pillars
module pillar(location_angle,){
		rotate([0,0,location_angle])translate([iso_rim_size/2-rim_distance_from_bead_to_inner_circle-pillar_support_wall_thickness-pillar_rod_diameter/2,0,0]){
		translate([0,0,pillar_support_wall_thickness])cylinder(r=pillar_rod_diameter/2, h=pillar_h);
	}
}
//this module makes the feet for the ring rap. this is where the bed will mount.
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
		translate([0,0,z_height-rim_width/2])rim_segment_spoked(iso_rim_size,number_of_spokes,90-location_angle-15,90-location_angle+15,spoke_hole_diam=spoke_hole_diameter,rim_shape=cur_rim_shape);
		translate([0,0,z_height-rim_width])difference(){
			cylinder(r=iso_rim_size,h=rim_width,$fa=1,$fs=10);
			cylinder(r=iso_rim_size/2,h=rim_width,$fa=1,$fs=10);
		}
	}
	
}




if(assembly){
	pillar_legs(0);
	pillar_legs(180);
	pillar(0);
	pillar(180);	

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