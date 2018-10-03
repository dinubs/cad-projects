include <ballJoint.scad>

cord_size=8;
cutout_ratio=3;
mount_height=8;

difference() {
  mount();
  cylinder(r=4, h=100, center=true);
  translate([-cord_size/(cutout_ratio*2), 0, 0])
    linear_extrude(height=100, center=true)
      square(size=[cord_size/cutout_ratio, 100]);
}

module mount() {
  joint();
  bar();
}

module bar() {
  difference() {
    translate([0, 1, size-2])
      cube(size=[35, 6, mount_height]);
    translate([20, 1, size - 2 + mount_height -2])
      cube(size=[10, 6, 2]);
    translate([10, 1, size - 2 + mount_height -2])
      cube(size=[5, 6, 2]);
  }
  translate([15, 4, size+mount_height])
    hole();
  translate([30, 4, size+mount_height])
    hole();
}

module hole() {
  rotate([0, 90, 0])
    difference() {
      union() {
        cylinder(r=3, h=5);
        translate([0, -3, 0]) cube([3, 6, 5]);
      }
      cylinder(r=2, h=5);
    };
}
