intomm = 25.4;
fan_hole_dist = 32;
$fn = 30;

translate([1/2*intomm,1/2*intomm])
difference(){
  square([18,4]*intomm);
  for(xof = [18/8/2*intomm:18/8*intomm:18*intomm]) {
  	#translate([xof,2*intomm])
    mount_holes();
  }
}


module mount_holes(type="fan") {
  for (xx = [-fan_hole_dist/2,fan_hole_dist/2]) {
    for (yy = [-fan_hole_dist/2,fan_hole_dist/2]) {
    	translate([xx,yy])
		circle(d=0.1495*intomm);
    }
  }
}