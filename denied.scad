difference() {
  cube(size=[95, 30, 10]);
  translate([0, 5, 0]) {
    linear_extrude(height=30, center=true) {
      text("Denied", 22);
    }
  }
}
