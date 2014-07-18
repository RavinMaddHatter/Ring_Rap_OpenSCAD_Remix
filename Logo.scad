difference(){
	cube([150,150,30],center=true);
	stamp();	
}
module stamp(){
	render(){
		difference(){
			union(){
				linear_extrude(999)import(file = "Logo.dxf",layer="Cut_out");	
				linear_extrude(999)import(file = "Logo.dxf",layer="Text"); 
			}
			logo();
		}
	}
}

module logo(){
	render(){
		linear_extrude(.1)import(file = "Logo.dxf",layer="Cut_out"); 
		linear_extrude(.1)import(file = "Logo.dxf",layer="Text"); 

		hull(){
			linear_extrude(1)import(file = "Logo.dxf",layer="GBase");
			linear_extrude(3)import(file = "Logo.dxf",layer="GHull3"); 
			linear_extrude(5)import(file = "Logo.dxf",layer="Hull2"); 
			linear_extrude(7.2)import(file = "Logo.dxf",layer="GHull1"); 
			linear_extrude(8)import(file = "Logo.dxf",layer="GHull0"); 
		}

		hull(){
			linear_extrude(1)import(file = "Logo.dxf",layer="TBase");
			linear_extrude(5)import(file = "Logo.dxf",layer="THull3"); 
			linear_extrude(6)import(file = "Logo.dxf",layer="THull1"); 
			linear_extrude(7.2)import(file = "Logo.dxf",layer="THull0"); 
		}
	}
}