depth = 4;
length = 100;
width = 25;

difference() {
  bar();
  translate([(length / 2), 0, 0]) hole();
  translate([-(length / 2), 0, 0]) hole();
  hole();
}

module hole() {
  cylinder(r=3, h=depth, center=true);
}

module bar() {
  cube(size=[length, width, depth], center=true);
  translate([length/2, 0, 0]) cylinder(r=width/2, h=depth, center=true);
  translate([-length/2, 0, 0]) cylinder(r=width/2, h=depth, center=true);
}
