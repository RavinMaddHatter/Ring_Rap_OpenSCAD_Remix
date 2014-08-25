include <constants.scad>


module rim_diam_check(ISO_rim_diameter,number_of_spokes,spoke_hole_diam,rim_shape="Nucleon_Front"){
	difference(){
		hull(){
			translate([0,0,-5])rim_segment(ISO_rim_diameter,number_of_spokes,1,24,rim_shape=rim_shape);
			translate([0,0, 5])rim_segment(ISO_rim_diameter,number_of_spokes,1,24,rim_shape=rim_shape);
		}
	rim_segment_spoked(ISO_rim_diameter,number_of_spokes,spoke_hole_diam=spoke_hole_diam,0,25,rim_shape=rim_shape);
	rim_segment(ISO_rim_diameter+10,number_of_spokes,0,25,rim_shape=rim_shape);
	}
}
module rim_profile_fit_sample(rim_shape="Nucleon_Front"){
	difference(){
		hull(){
			translate([5,0,0])linear_extrude(10)import(file = "rim_section_contour.dxf",layer=rim_shape);	
			translate([-5,0,0])linear_extrude(10)import(file = "rim_section_contour.dxf",layer=rim_shape);	
			translate([0,-5,0])linear_extrude(10)import(file = "rim_section_contour.dxf",layer=rim_shape);	
		}
		linear_extrude(10)import(file = "rim_section_contour.dxf",layer=rim_shape);
		translate([-500,0,0])cube([1000,1000,15]);
	}
}


module rim_spoked(ISO_rim_diameter, number_of_spokes,spoke_hole_diam=2,rim_shape="Nucleon_Front", number_of_segments=70){
	rotate_extrude(convexity = 10,$fn=number_of_segments)translate([ISO_rim_diameter/2, 0, 0])rotate([0,0,270])import(file = "rim_section_contour.dxf",layer=rim_shape);
	for (spoke_num=[1:number_of_spokes]){
		rotate([spoke_num*360/number_of_spokes,90,0])translate([0,ISO_rim_diameter/2,0])rotate([90,0,0])cylinder(r=spoke_hole_diam/2,h=ISO_rim_diameter/8);
	}
}
module rim(ISO_rim_diameter, number_of_spokes,spoke_hole_diam=2,rim_shape="Nucleon_Front", number_of_segments=70){
	difference(){
		rotate_extrude(convexity = 10,$fn=number_of_segments)translate([ISO_rim_diameter/2, 0, 0])rotate([0,0,270])import(file = "rim_section_contour.dxf",layer=rim_shape);
		for (spoke_num=[1:number_of_spokes]){
			rotate([spoke_num*360/number_of_spokes,90,0])translate([0,ISO_rim_diameter/4,0])rotate([270,0,0])cylinder(r=spoke_hole_diam/2,h=ISO_rim_diameter/2);
		}
	}
}

module rim_segment(ISO_rim_diameter, number_of_spokes, start_angle,stop_angle,number_of_segments=5,spoke_hole_diam=2,rim_shape="Nucleon_Front",$fn=15){
	
	arc_length=(stop_angle-start_angle);
	rotate([0,90,0])union(){
		for (cur_ang=[start_angle:arc_length/number_of_segments:stop_angle]){
			rotate([cur_ang,0,0])translate([0,ISO_rim_diameter/2,-.5*(arc_length/360)*pi*ISO_rim_diameter/number_of_segments])linear_extrude(pi*ISO_rim_diameter*(arc_length/360)/number_of_segments)import(file = "rim_section_contour.dxf",layer=rim_shape);
		}
	}
}

module rim_segment_spoked(ISO_rim_diameter, number_of_spokes, start_angle,stop_angle,number_of_segments=5,spoke_hole_diam=2,rim_shape="Nucleon_Front",$fn=15){
	
	arc_length=(stop_angle-start_angle);
	rotate([0,90,0])union(){
		for (cur_ang=[start_angle:arc_length/number_of_segments:stop_angle]){
			rotate([cur_ang,0,0])translate([0,ISO_rim_diameter/2,-.5*(arc_length/360)*pi*ISO_rim_diameter/number_of_segments])linear_extrude(pi*ISO_rim_diameter*(arc_length/360)/number_of_segments)import(file = "rim_section_contour.dxf",layer=rim_shape);
		}
		for (spoke_num=[1:number_of_spokes]){
					rotate([spoke_num*360/number_of_spokes,0,0])translate([0,ISO_rim_diameter/2,0])rotate([90,0,0])cylinder(r=spoke_hole_diam/2,h=ISO_rim_diameter/8,$fn=15);

		}
		
	}
}


