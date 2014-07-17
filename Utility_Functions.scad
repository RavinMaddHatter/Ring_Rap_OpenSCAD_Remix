include <constants.scad>


module nut(nut_wrench_size_in_mm,nut_thickness,center_diameter=0){
	difference(){
		cylinder(r=nut_wrench_size_in_mm*sin(60)/2,h=nut_thickness,$fn=6);
		if(center_diameter>0){
			cylinder(r=center_diameter,h=nut_thickness);
		}
	}
}