lip_size = 3;
inner_radius = 45;
height = 6;
inner_height = 4;
outer_radius = inner_radius + lip_size;

module outside() {
  translate([0, 0, 1]) {
    difference() {
      cylinder(r=outer_radius, h=height, center=true);
      cylinder(r=inner_radius, h=height + 1, center=true);
    }
  }
}

module inner() {
  cylinder(r=inner_radius, h=inner_height, center=true);
}
