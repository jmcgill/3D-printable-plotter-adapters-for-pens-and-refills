// Refactored by Julien Dorra
// based on code by Sasha Kovar <sasha-thing@arcocene.org>
// from a design by Brian Boucheron <brian@boucheron.org>
// and on code and measurements by Ed Nisley KE4ZNU April 2015

// Measurements and modules common across adapters.

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
    [11.5/2,43.25],                 // 16 upper body
    [0.0,43.25]                     // 17 lid over reservoir
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
    

// Additional spacing for friction fit (as part of radius)
e = 0.15;

topOfLedgeToPenTip = 17.5;
heightOfLedge = 1.21;
heightOfPenTip = 4.3; // topOfLedgeToPenTip - heightOfLedge;
heightOfPartAboveLedge = 10.22;
heightOfInkCanister = 26.29;
heightOfCap = 4.5;
fullHeight = 43.36;

Lid = [
    [0.0, 0.0],
    [(8.5 + e) / 2, 0.0],
    [(8.5 + e) / 2, 5],
    [(11.5 + e) / 2, 5],
    [(11.5 + e) / 2, 8],
    [0.0, 8]
];

// The pen would be swallowed whole by the adaptor, so we expand the piece we're subtracting
f = 5;

TombowNib = [              // X values = (measured diameter)/2, Y as distance from tip
    [0.0,0.0], [0.9/2,0.0],                      //  0 fiber pen tip

    [2.8/2, heightOfPenTip],            //  1 end of pen w/ tip
    
    [(7.2 + f)/2, heightOfPenTip], [(7.2 + f)/2, topOfLedgeToPenTip - heightOfLedge],
    
    [(9.52 + f)/2, topOfLedgeToPenTip - heightOfLedge], [(9.52 + f)/2, topOfLedgeToPenTip],
    
    [(8.32 + e)/2, topOfLedgeToPenTip], [(8.32 + e)/2, topOfLedgeToPenTip + heightOfPartAboveLedge],
    
    [(7.5 + e) /2, topOfLedgeToPenTip + heightOfPartAboveLedge], [(7.5 + e) /2, fullHeight],
    
    [0.0, fullHeight]
];

TombowNib2 = [              // X values = (measured diameter)/2, Y as distance from tip
    [0.0,0.0], [0.9/2,0.0],                      //  0 fiber pen tip

    [2.8/2, heightOfPenTip],            //  1 end of pen w/ tip
    
    [(7.2)/2, heightOfPenTip], [(7.2)/2, topOfLedgeToPenTip - heightOfLedge],
    
    [(9.52)/2, topOfLedgeToPenTip - heightOfLedge], [(9.52)/2, topOfLedgeToPenTip],
    
    [8.32/2, topOfLedgeToPenTip], [8.32/2, topOfLedgeToPenTip + heightOfPartAboveLedge],
    
    [7.5/2, topOfLedgeToPenTip + heightOfPartAboveLedge], [7.5/2, fullHeight],
    
    [0.0, fullHeight]
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
            polygon(points=TombowNib);
}

module nib() {
    render(convexity=3)
        rotate_extrude($fn=160)
            polygon(points=TombowNib2);
}


// HP plotter pen adapter body
module adapter_body() {
    render(convexity=3)
        rotate_extrude($fn=160)
            polygon(points=BodyOutline);
}

module lid() {
    translate([0, 0, fullHeight - 8])
        render(convexity=3)
            rotate_extrude($fn=160)
                polygon(points=Lid);    
}

// Defaults values 
// for a Staedtler pigment liner pen

pen_top_diameter = 8.35 ; 
pen_bottom_diameter = 4.80 ; 

diameter_spacing = 0.3 ; // increase = easier to slide the pen. If you set it to 0 it will be very hard to get the pen in.

height_where_pen_diameter_change = 12.20 ; // Measured from the tip (ie. paper)

bottom_cut_off_height = height_where_pen_diameter_change - 3 ;

top_cut_off_height = total_body_height - 11.25 ; // must be bigger than total_body_height - 12

simplified_body_shape=false ;

// This module substract a simplified pen volume 
// composed of 2 cylinders
// from the HP plotter adapter body.
  
//difference() {
    

//    color ("red") translate([0,0,height_where_pen_diameter_change])     
//                    cylinder(r= (pen_top_diameter+diameter_spacing)/2, 
//                             h= 100 , 
//                             $fn= 80);
                             
//    color ("blue") cylinder(r=(pen_bottom_diameter+diameter_spacing)/2, 
//                                 h=height_where_pen_diameter_change, 
//                                 $fn=80);       

// color("red") lid();

color("blue") nib();
difference() {                             
    color ([1.0, 1.0, 1.0, 0.7]) adapter_body () ;
    color ("blue") tip_body();
    color ("red") lid();
//    color ([1.0, 1.0, 1.0, 0.7]) adapter_body () ;
}


