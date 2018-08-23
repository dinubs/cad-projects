s = 20; // Size of the cube
r = 8; // Radius of minkowski function
outside = s/2 + r;

// 1 Quarter size of the width of the cube
// Used for placing dots in positions
q = s/4 + r/4;
d = -q;

// Available spots for the dots
spots = [
  [d, q, 0],
  [0, q, 0],
  [q, q, 0],
  [d, 0, 0],
  [0, 0, 0],
  [q, 0, 0],
  [d, d, 0],
  [0, d, 0],
  [q, d, 0]
];

/*
 * Places a dot sphere to carve out
 * with a radius of 3
 */
module dot() {
  sphere(r=3);
}

/*
 * Given an array of spots, place a
 * dot in each position in the array
 */
module side(ps = [5]) {
  translate([0, 0, outside]) {
    for (i=ps) {
      translate(spots[i - 1]) dot();
    }
  }
}

difference() {
  // Make the edges of the cube slightly rounded
  minkowski() {
    cube(size=[s,s,s], center=true);
    sphere(r=r);
  }
  color("cyan") {
    // Render the dots
    rotate([0, 0, 0]) side([5], false); // 1
    rotate([90, 0, 0]) side([1,9], false); // 2
    rotate([0, 90, 0]) side([3,5,7], false); // 3
    rotate([0, -90, 0]) side([1,3,7,9], false); // 3
    rotate([-90, 0, 0]) side([1,3,5,7,9], false); // 5
    rotate([180, 0, 0]) side([1,3,4,6,7,9], false); // 6
  }
}
