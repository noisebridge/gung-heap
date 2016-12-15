min_border = 2;

rfid_width = 9.47;
rfid_length = 15.67;
rfid_depth = 1.14;

hole_length = min_border * 2;

fob_width = min_border * 2 + rfid_width;
fob_length = 20.00;
fob_length = min_border * 3 + rfid_length + hole_length;
fob_depth = min_border * 2 + rfid_depth;

hole_width = rfid_width;

difference () {
    cube([fob_width, fob_length, fob_depth]);
    translate([min_border, min_border, min_border]) {
        cube([rfid_width, rfid_length, 20]);
    }
    translate([min_border,
               min_border * 2 + rfid_length,
               0]) {
        cube([hole_width, hole_length, fob_depth]);
    }
}


translate([15, 0, 0]) {
    cube([rfid_width, rfid_length, min_border]);
}
