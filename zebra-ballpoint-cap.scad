// Refactored by Julien Dorra
// based on code by Sasha Kovar <sasha-thing@arcocene.org>
// from a design by Brian Boucheron <brian@boucheron.org>
// and on code and measurements by Ed Nisley KE4ZNU April 2015

// Measurements and modules common across adapters.

use <threadlib/threadlib.scad>

total_body_height = 43.25 ;

// Original HP plotter short pen, 
// serves as a body for the actual pen to slide in

 
OriginalBodyOutline = [                     // X values = (measured diameter)/2, Y as distance from tip
    [0.0,0.0],                      //  0 fiber pen tip
    [2.0/2,1.4],                    //  1 ... taper (not buildable)
    //[1.0/2,0.005],                  //  1 ... faked point to remove taper
    [2.0/2,0.0],[2.0/2,2.7],        //  2 ... cylinder
    [3.7/2,2.7],[3.7/2,4.45],       //  4 tip surround
    [4.8/2,5.2],                    //  6 chamfer
    [6.5/2,11.4],                   //  7 rubber seal face
    [8.9/2,11.4],                   //  8 cap seat
    [11.2/2,15.9],                  //  9 taper to body
    [11.5/2,28.0],                  // 10 lower body
    [13.2/2,28.0],[16.6/2,28.5],    // 11 lower flange = 0.5
    [16.6/2,29.5],[13.2/2,30.0],    // 13 flange rim = 1.0
    [11.5/2,30.0],                  // 15 upper flange = 0.5
    [11.5/2,43.25],                 // 16 upper body
    [0.0,43.25]                     // 17 lid over reservoir
    ];
 
BodyOutline = [                     // X values = (measured diameter)/2, Y as distance from tip
    [0.0,0.0],                      //  0 fiber pen tip
    //[2.0/2,1.4],                    //  1 ... taper (not buildable)
    //[1.0/2,0.005],                  //  1 ... faked point to remove taper
    //[2.0/2,0.0],[2.0/2,2.7],        //  2 ... cylinder
    //[3.7/2,2.7],[3.7/2,4.45],       //  4 tip surround
    //[4.8/2,5.2],                    //  6 chamfer
    [1.0/2,7.15],
    [4.0/2,7.15],
    [6.5/2,11.4],                   //  7 rubber seal face
    [8.9/2,11.4],                   //  8 cap seat
    [11.2/2,15.9],                  //  9 taper to body
    [11.5/2,28.0],                  // 10 lower body
    [13.2/2,28.0],[16.6/2,28.5],    // 11 lower flange = 0.5
    [16.6/2,29.5],[13.2/2,30.0],    // 13 flange rim = 1.0
    [11.5/2,30.0],                  // 15 upper flange = 0.5
    [11.5/2,40.25],                 // 16 upper body
    [0.0,40.25]                     // 17 lid over reservoir
    ];

KohINoorModel = [                     // X values = (measured diameter)/2, Y as distance from tip
    [0.0,0.0],                      //  0 fiber pen tip
    [2.0/2,1.4],                    //  1 ... taper (not buildable)
    //[1.0/2,0.005],                  //  1 ... faked point to remove taper
    [2.0/2,0.0],[2.0/2,2.7],        //  2 ... cylinder
    [3.7/2,2.7],[3.7/2,4.45],       //  4 tip surround
    [4.8/2,5.2],                    //  6 chamfer
    [6.5/2,11.4],                   //  7 rubber seal face
    [8.9/2,11.4],                   //  8 cap seat
    [11.2/2,15.9],                  //  9 taper to body
    [11.5/2,28.0],                  // 10 lower body
    [13.2/2,28.0],[16.6/2,28.5],    // 11 lower flange = 0.5
    [16.6/2,29.5],[13.2/2,30.0],    // 13 flange rim = 1.0
    [11.5/2,30.0],                  // 15 upper flange = 0.5
    [11.5/2,43.25],                 // 16 upper body
    [0.0,43.25]                     // 17 lid over reservoir
    ];
    
e = 0.1;

heightOfPenTip = 19.4;
heightOfPartAboveLedge = 5.3;
heightOfInkCanister = 21;
heightOfCap = 4.5;

ZebraTip = [              // X values = (measured diameter)/2, Y as distance from tip
    [0.0,0.0],
    [(3.25 + e) / 2, 1],
    [(3.25 + e) / 2, heightOfPenTip],
    [(5 + e) / 2, heightOfPenTip],
    [(5 + e) / 2, heightOfPenTip + heightOfInkCanister],
    [0, heightOfPenTip + heightOfInkCanister]
    // TODO(jimmy): The space for the end cap
];
    
// Simplified HP plotter short pen, with a basic cylinder as the bottom body part
// Useful when the botton part of the adapter must be long
// Downside: will not fit in a carrousel or other plotter rack
    
BodyOutlineSimplified = [                     // X values = (measured diameter)/2, Y as distance from tip
    [0.0,0.0],                      //  0 start, equivalent to the tip
    [11.5/2,0.0],                  //  1 enlarging at the size of lower body
  
    [11.5/2,28.0],                  // 10 lower body
    [13.2/2,28.0],[16.6/2,28.5],    // 11 lower flange = 0.5
    [16.6/2,29.5],[13.2/2,30.0],    // 13 flange rim = 1.0
    [11.5/2,30.0],                  // 15 upper flange = 0.5
    [11.5/2,43.25],                 // 16 upper body
    [0.0,43.25]                     // 17 lid over reservoir
    ];
      
  

module tip_body() {
    render(convexity=3)
        rotate_extrude($fn=160)
            polygon(points=ZebraTip);
}

// HP plotter pen adapter body
module adapter_body() {
    render(convexity=3)
        rotate_extrude($fn=160)
            polygon(points=BodyOutline);
}


//thread("G1/2-ext", turns=10);

pitch = 3;
scale = 0.8;

MY_THREAD_TABLE = [
["M10x3-ext", [3, 4.1360 * scale, 8.4455 * scale, [[0, -1.3100], [0, 1.3100], [1.8975, 0.2145], [1.8975, -0.2145]]]],
["M10x3-int", [3, -5.1644 * scale, 10.1700 * scale, [[0, 1.4727], [0, -1.4727], [1.8375, -0.4118], [1.8375, 0.4118]]]]
];

turns = 4;

//bolt("3D-ext", turns=15, higbee_arc=30, table=MY_THREAD_TABLE);

module bolt(pitch, turns, scale) {
H = (turns + 1) * pitch;
translate([0, 0, -pitch / 2])
    cylinder(h=H, d=8.4455 * scale, $fn=120);
thread("M10x3-ext", turns=turns, table=MY_THREAD_TABLE);
}


H = (turns + 1) * pitch;

//difference() {
//    bolt(pitch, turns, scale);
//    color("blue")
//        translate([0, 0, -(pitch/2) - 0.1])
//            cylinder(h=H, d=5, $fn=120);
//}


module nub(turns, pitch) {
    H = (turns + 1) * pitch;
    color("green")
        translate([0, 0, H -(pitch/2)-5])
            cylinder(h=5, d=2.75, $fn=120);
}

module cap(turns, pitch) {
    H = (turns + 1) * pitch;
    color("red")
        translate([0, 0, H -(pitch/2)])
            cylinder(h=pitch, d=11.7, $fn=120);
}

module topbolt(turns, pitch, scale) {
    union() {
        nub(turns, pitch);
        cap(turns, pitch);
        difference() {
             bolt(pitch, turns, scale);
            color("blue")
            translate([0, 0, -(pitch/2) - 0.1])
                cylinder(h=H, d=5, $fn=120);
        }
    }
}

show_components = false;

if (show_components) {
    
    color ("blue") tip_body();

    color ("yellow")
    translate([0, 0, 43.25-H-(pitch/2)])
            nut("M10x3", turns, 11.25, table=MY_THREAD_TABLE);
}

union() {
    difference() {                                 
        color ([1.0, 1.0, 1.0, 0.3]) adapter_body () ;
        color ("blue") tip_body();
        
        // Avoid a really thin wall
        cylinder(h=9, d=10, $fn=120);
        
        color("green") 
            translate([0, 0, 43.25-H-(pitch/2)]) cylinder(h=H, d=11.25, $fn=120);
    }
    
    translate([0, 0, 43.25-H-(pitch/2)])
        nut("M10x3", turns, 11.25, table=MY_THREAD_TABLE);
}



//nut("M10x1.25", turns, 11.5, table=MY_THREAD_TABLE);

// translate([0, 0, 50]) topbolt(turns, pitch, scale);


//color ([1.0, 1.0, 1.0, 0.7])
//    translate([0, 0, -pitch / 2])
//        cylinder(h=18, d=11.35, $fn=120);
        
