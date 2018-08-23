// Sticking to multiples of 8
units = 16;
length = 64;
width = 32;

top();
translate([-units, 0, units/2]) rotate([0, 180, 0]) bottom();

module top() {
  entire();
  divots(8);
}

module bottom() {
  difference() {
    entire();
    divots(8);
  }
}

module entire(l = length) {
  difference() {
    linear_extrude(height=units/2, center=true) {
      difference() {
        bar(l);
        translate([l/2, 0]) hole();
      }
    }
  }
}

module bar(l = length) {
  square(size=[l, width], center=true);
  translate([l/2, 0, 0]) circle(r=units);
}

module hole() {
  circle(r=units/4, center=true);
}

module divots(num = 4, offset = length) {
  deg = 360 / num;
  translate([offset/2, 0, units/4]) {
    for (i=[1:num]) {
      rotate([0, 0, i * deg]) {
        translate([0, units*.75, 0]) sphere(r=units/6);
      }
    }
  }
}
