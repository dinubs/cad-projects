shelf_z = 10;
shelf_width = 150;
shelf_height = 80;
shelf_walls = 15;

module triangle(o_len, a_len, depth, center=false) {
  centroid = center ? [-a_len/3, -o_len/3, -depth/2] : [0, 0, 0];
  translate(centroid) linear_extrude(height=depth) {
      polygon(points=[[0,0],[a_len,0],[0,o_len]], paths=[[0,1,2]]);
  }
}

module outline(wall = 1) {
  difference() {
    offset(wall / 2) children();
    offset(-wall / 2) children();
  }
}

module extrude(height=shelf_z) {
  linear_extrude(height=height) children();
}

module tri_shelf() {
  minkowski() {
    triangle(shelf_height, shelf_width, shelf_z);
    cylinder(r=5);
  }
}

module screw_countersunk(
        l=20,   //length
        dh = 6,   //head dia
        lh = 3,   //head length
        ds = 3.2,  //shaft dia
        ) {
    union() {
        cylinder(h=lh, r1=dh/2, r2=ds/2, $fn=6);
        polyhole(h=l, d=ds);
    }
}

difference() {
  tri_shelf();
  scale([.7, .7, 1]) {
    translate([shelf_width * .15, shelf_height * .15, 0]) {
      tri_shelf();
    }
  }
  screw_countersunk();
}

translate([-5, -40, 0]) {
  extrude(shelf_z + 1) {
    square(size=[5, shelf_height + 40]);
  }
}



