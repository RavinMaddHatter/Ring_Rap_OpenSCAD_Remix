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
//top for Ring_rap is contained in Top.scad
include <Top.scad>
//top rim setup
//include <Top.scad>
//$fs=1;
//$fa=1;
part=0;
build=false;
if(part==1){
	echo("name:rim_profile.STL");
	if(build){
		rim_profile_fit_sample(rim_shape=cur_rim_shape);
	}
}
if(part==2){
	echo("name:rim_contour.STL");
	if(build){
		translate([0,0,overall_rim_thickness-.985*iso_rim_size/2])rotate([90,-12,0])rim_diam_check(iso_rim_size,number_of_spokes,spoke_hole_diameter,rim_shape=cur_rim_shape);
	}
}
if(part==3){
	echo("name:Base_Leg_1.STL");
	if(build){
		translate([-iso_rim_size*sin(45)/2,-iso_rim_size*sin(45)/2,0])base_legs(45,base_leg_footprint,base_leg_height);
	}
}
if(part==4){
	echo("name:Base_Leg_2.STL");
	if(build){
		translate([iso_rim_size*sin(45)/2,-iso_rim_size*sin(45)/2,0])base_legs(135,base_leg_footprint,base_leg_height);
	}
}
if(part==5){
	echo("name:Base_Leg_3.STL");
	if(build){
		translate([iso_rim_size*sin(45)/2,iso_rim_size*sin(45)/2,0])base_legs(225,base_leg_footprint,base_leg_height);
	}
}
if(part==6){
	echo("name:Base_Leg_4.STL");
	if(build){
		translate([-iso_rim_size*sin(45)/2,iso_rim_size*sin(45)/2,0])base_legs(315,base_leg_footprint,base_leg_height);
	}
}
if(part==7){
	echo("name:Base_Pillar_1.STL");
	if(build){
		translate([-iso_rim_size/2,0,0])pillar_legs(0);
	}
}
if(part==8){
	echo("name:Base_Pillar_2.STL");
	if(build){
		translate([iso_rim_size/2,0,0])rotate([0,0,0])pillar_legs(180);
	}
}
if(part==9){
	echo("name:Base_Pillar_3.STL");
	if(build){
		translate([iso_rim_size/2,0,0])rotate([0,0,90])pillar_legs(90);
	}
}
if(part==10){
	echo("name:Cross_carrage.STL");
	if(build){
		translate([0,0,cross_carriage_bearings[1]*.8])cross_carrage();
	}
}
if(part==11){
	echo("name:Gantry_corner_1.STL");
	if(build){
		rotate([0,180,0])translate([-iso_rim_size*sin(45)/2,-iso_rim_size*sin(45)/2,-(distance_between_rods+mount_wall_thickness+Sled_bearings[2]*2+overall_rim_thickness/2)])carriage_rim_mount(45);
	}
}
if(part==12){
	echo("name:Gantry_corner_2.STL");
	if(build){
		rotate([0,180,0])translate([-iso_rim_size*sin(45)/2,iso_rim_size*sin(45)/2,-(distance_between_rods+mount_wall_thickness+Sled_bearings[2]*2+overall_rim_thickness/2)])carriage_rim_mount(135);
	}
}
if(part==13){
	echo("name:Gantry_corner_3.STL");
	if(build){
		rotate([0,180,0])translate([iso_rim_size*sin(45)/2,iso_rim_size*sin(45)/2,-(distance_between_rods+mount_wall_thickness+Sled_bearings[2]*2+overall_rim_thickness/2)])carriage_rim_mount(225);
	}
}
if(part==14){
	echo("name:Gantry_corner_4.STL");
	if(build){
		rotate([0,180,0])translate([iso_rim_size*sin(45)/2,-iso_rim_size*sin(45)/2,-(distance_between_rods+mount_wall_thickness+Sled_bearings[2]*2+overall_rim_thickness/2)])carriage_rim_mount(315);
	}
}
if(part==15){
	echo("name:Gantry_Pillar_1.STL");
	if(build){
		rotate([0,0,0])translate([0,-iso_rim_size/2,0])pillar_bushing(0);
	}
}
if(part==16){
	echo("name:Gantry_Pillar_2.STL");
	if(build){
		rotate([0,0,0])translate([0,iso_rim_size/2,0])pillar_bushing(180);
	}
}
if(part==17){
	echo("name:Gantry_Pillar_3.STL");
	if(build){
		rotate([0,0,90])translate([-iso_rim_size/2,0,0])pillar_bushing(90);
	}
}
if(part==18){
	echo("name:Sleds_1-4.STL");
	if(build){
		rotate([0,0,0])translate([0,-sin(45)*iso_rim_size/2,mount_wall_thickness+Sled_bearings[1]-carrage_z_offset])slider();
	}
}
if(part==19){
	echo("name:top1.STL");
	if(build){
		rotate([180,0,90])translate([-iso_rim_size/2,0,-overall_rim_thickness/2-mount_wall_thickness])top_pillar_mount(0);
	}
}
if(part==20){
	echo("name:top2.STL");
	if(build){
		rotate([180,0,90])translate([iso_rim_size/2,0,-overall_rim_thickness/2-mount_wall_thickness])top_pillar_mount(180);
	}
}
if(part==21){
	echo("name:top3.STL");
	if(build){
		rotate([180,0,0])translate([0,iso_rim_size/2,-overall_rim_thickness/2-mount_wall_thickness])top_pillar_mount(90);
	}
}