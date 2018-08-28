include <balljoint.scad>

module joined() {
  translate([0,0,size]) ball();
  translate([0,0,-14]) joint();
}

cord_size=8;
cutout_ratio=3;

difference() {
  joined();
  cylinder(r=cord_size/2, h=100, center=true);
  translate([-cord_size/(cutout_ratio*2), 0, 0])
    linear_extrude(height=100, center=true)
      square(size=[cord_size/cutout_ratio, 100]);
}
