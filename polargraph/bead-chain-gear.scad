// Modified from https://github.com/adgaudio/3dPrinter/blob/master/gears/bead_chain_gear.scad

include <../lib/bolts.scad>;

bead_radius = 4.6/2; //6.05/2; //4.45/2;
link_radius=.5;
lock_width=3;

// Gear Dimensions
n_teeth = 16;
r_g = 15;
r_motor_shaft = 5.4/2;
l_motor_shaft = 10;
/*cover_height=2;*/
r_bearing = 22/2 + .6;  // 608zz bearings
d_bearing_inner = 8 + 2;
h_bearing = 7;
h_g = 2 + bead_radius * 2 * (1 + .25 + .2 );

///////////////////////////
// Gears
///////////////////////////


module make_sphere_ring(r=r_g, r_tooth=bead_radius, n_teeth=n_teeth, $fn=15) {
  union(){
    for (i = [0:n_teeth]){
      rotate([0,0,i*360/n_teeth])
      translate([r_g,0,0])
      hull() {
        sphere(r_tooth);
        /*translate([-.5 * r_tooth,0,0])sphere(r_tooth);*/
        translate([-.5 * r_tooth,0,.345])sphere(r_tooth);
        translate([-.5 * r_tooth,0,.345])sphere(r_tooth);
        translate([0,0,.575])sphere(r_tooth);
        translate([0,0,.575])sphere(r_tooth);
      }
    }
  }
}

module make_torus(r=r_g, r_link=link_radius) {
  // openscad apparently can't handle rotate_extrude in a difference, so this isn't a real cylinder
  //rotate_extrude(convexity=10)translate([ring_radius, 0, 0])circle(inner_radius);
  d_link = r_link * 2;
  difference() {
    cylinder (h=d_link, r=r, center=true);
    cylinder (h=d_link, r=r - d_link, center=true);
  }
}

module bead_ring() {
  union() {
    make_sphere_ring();
    make_torus();
  }
}

module gear_base() {
  difference() {
    union() {
      cylinder(h=h_g, r=r_g, center=true, $fn=n_teeth);
      // Covers
      /*translate([0,0,.5 * (h_g + cover_height)])*/
        /*cylinder(h=cover_height, r=r_g+bead_radius, center=true, $fn=n_teeth);*/
      /*translate([0,0,-.5 * (h_g + cover_height)])*/
        /*cylinder(h=cover_height, r=r_g+bead_radius, center=true, $fn=n_teeth);*/
    }
    # bead_ring();
  }
}

module make_gear_for_motor() {
  difference() {
    union() {
      gear_base();
      cylinder(h=l_motor_shaft, r=r_motor_shaft + 4, center=false);
    }
    bolt(m=2*r_motor_shaft, h=l_motor_shaft * 200);
#   translate([0, 0, min(h_g/2, l_motor_shaft) + lock_width/2 + 1])rotate([0, 90, 90])bolt(m=lock_width, h=r_motor_shaft + 4, center=false);
} }

module make_gear_for_608ZZ_bearing() {
  difference() {
    gear_base();
    /*bolt(m=d_bearing_inner, h=20*20);*/
    /*translate([0, 0, 1])cylinder(r=r_bearing, h=h_g, center=true);*/
    cylinder(r=r_bearing, h=h_g, center=true);
  }
}

make_gear_for_motor();
make_gear_for_608ZZ_bearing();
