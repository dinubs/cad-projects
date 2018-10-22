$fn = 360;

include <base.scad>

outside();

difference() {
  inner();
  translate([-27, -35, 1]) {
    scale([0.43, 0.43, 0.43]) {
      import("YD.stl", convexity=3, center=true);
    }
  }
  translate([0, 0, -2]) {
    scale([0.43, 0.43, 0.43]) {
      import("cakestand.stl", convexity=3, center=true);
    }
  }
}

