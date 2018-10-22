$fn = 360;

include <base.scad>

outside();

difference() {
  inner();
  translate([0, -8, 1]) {
    scale([1.2, 1.2, 1.2]) {
      import("logo.stl", convexity=3);
    }
  }
}
