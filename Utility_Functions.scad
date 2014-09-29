include <constants.scad>

module belt_teeth(belt_type=[1.25,0.85,2.5,6,1.5],num_teeth=3){
	for(i = [-1:num_teeth-2]){
	// teeth to grip belt	
	translate([belt_type[3] / 2 + i * belt_type[2], 0, belt_type[1] / 2 - .01 ])
	cube([belt_type[0], belt_type[3], belt_type[1]], center = true);
	}
}

module nut(nut_wrench_size_in_mm,nut_thickness,center_diameter=0){
	difference(){
		cylinder(r=nut_wrench_size_in_mm*sin(60)/2,h=nut_thickness,$fn=6);
		if(center_diameter>0){
			cylinder(r=center_diameter,h=nut_thickness);
		}
	}
}

//
// Mendel90
//
// GNU GPL v2
// nop.head@gmail.com
// hydraraptor.blogspot.com
//
// Linear bearings
//
LM10UU = [29, 19, 10];
LM8UU  = [24, 15,  8];
LM6UU  = [19, 12,  6];
LM4UU  = [12,  8,  4];

function bearing_radius(type) = type[1] / 2;

module linear_bearing(type) {
	render() rotate([0,90,0]) difference() {
        cylinder(r = bearing_radius(type), h = type[0], center = true);
        cylinder(r = type[2] / 2, h = type[0] + 1, center = true);
    }
}
