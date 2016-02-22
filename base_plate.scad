//////////PARAMETERS
// fan or stepper?
mount_type = "stepper";
num_chambers = 8;
height = 4;
min_width = height;
corner_radius = 10;

/// derived
width = max((18/8)*num_chambers,min_width);

intomm = 25.4;
fan_hole_dist = 32;
stepper_hole_dist = 42;
$fn = 30;

//translate([1/2*intomm,1/2*intomm])
difference(){
  rsquare([width,height]*intomm,corner_radius);
  for(xof = [width/num_chambers/2*intomm:width/num_chambers*intomm:width*intomm]) {
  	translate([xof,height/2*intomm])
    mount_holes(mount_type);
  }
}

module mount_holes(type="fan") {
  x_loc = type == "fan"? [-fan_hole_dist/2,fan_hole_dist/2]:[0];
  y_loc = type == "fan"? [-fan_hole_dist/2,fan_hole_dist/2]:[-stepper_hole_dist/2,stepper_hole_dist/2];
  for (xx = x_loc) {
    for (yy = y_loc) {
      echo(xx);
      translate([xx,yy])
      circle(d=0.1495*intomm);
    }
  }
}


module rsquare(xy,r) {
  hull() {
    for (xx = [r,xy[0]-r]) {
      for (yy = [r,xy[1]-r]) {
        translate([xx, yy])
          circle(r);
      }
    }
  }
}