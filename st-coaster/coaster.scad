translate([0, 0, 1]) {
  difference() {
    cylinder(r=43, h=8, center=true);
    cylinder(r=40, h=8, center=true);
  }
}

difference() {
  cylinder(r=40, h=6, center=true);
  translate([0, -8, 2]) {
    scale([1.2, 1.2, 1.2]) {
      import("logo.stl", convexity=3);
    }
  }
}

