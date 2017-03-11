

module side( depth
           , height
           , tongue
           , material
           , shelves) {
    difference () {
        square([height, depth]);
        space = height / (shelves + 1);
        for (shelf=[0:shelves - 1]) {
            translate( [space * (shelf + 1) - material / 2
                     , (depth - tongue) / 2]) {
                square([material, tongue]);
            }
        }
    }

}

module shelf( width
            , height
            , tongue
            , material ) {
    a_tongue = tongue + 2;
    square([height - 2 * material, width]);
    translate([-material, (width - a_tongue) / 2]) {
        square([material, a_tongue]);
    }
    translate([height - 2 * material, (width - a_tongue) / 2]) {
        square([material, a_tongue]);
    }     
}

module shelves( width
              , height
              , depth
              , tongue
              , material
              , shelves) {
    for (h=[0:1]) {
       translate([(height + 20) * s, 0]) {
            side(depth, height, tongue, material, shelves);
       }
       for (s=[0:shelves / 2 - 1]) {
        translate([height + 20+ 20 + s * (width + 5) , 0]) {
            shelf(depth, width, tongue, material);
        }
    }
    }
    
}

a = 1200 * 30 / 33;
b = 3000 * 30 / 33;
shelves(a, b, a, 600, 20, 4);

