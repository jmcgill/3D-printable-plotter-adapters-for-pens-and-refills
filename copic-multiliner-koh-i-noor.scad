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

OriginalKohINoorModel = [                     // X values = (measured diameter)/2, Y as distance from tip
    [0.0,0.0],                      //  0 fiber pen tip
    [2.0/2,3.18],                    //  1 ... taper (not buildable)
    //[1.0/2,0.005],                  //  1 ... faked point to remove taper
    [3.45/2,3.18],        //  2 ... cylinder
    [4.8/2,3.18 + 0.6],                    //  6 chamfer
    [6.4/2,3.18 + 0.6 + 6.6],                   //  7 rubber seal face
    [9.7/2,3.18 + 0.6 + 6.6],
    
    [11.45/2,3.18 + 0.6 + 6.6 + 2],

    [11.45/2,3.18 + 0.6 + 6.6 + 2 + 15.8],
    
    [16.6/2, 3.18 + 0.6 + 6.6 + 2 + 15.8 + 0.5],
    [16.6/2, 3.18 + 0.6 + 6.6 + 2 + 15.8 + 0.5 + 1],

    [11.45/2, 3.18 + 0.6 + 6.6 + 2 + 15.8 + 0.5 + 1 + 0.5],

    [11.7/2, 44.2],

    [0.0, 44.2]
    ];


KohINoorModel = [                     // X values = (measured diameter)/2, Y as distance from tip
    [0.0,0.0],                      //  0 fiber pen tip
    // [2.0/2,3.18],                    //  1 ... taper (not buildable)
    // [1.0/2,0.005],                  //  1 ... faked point to remove taper
    // [3.45/2,3.18],        //  2 ... cylinder
    
    [1.0/2,7.15],
    [4.0/2,7.15],
    // [4.8/2,3.18 + 0.6],                    //  6 chamfer
    [6.4/2,3.18 + 0.6 + 6.6],                   //  7 rubber seal face
    [9.7/2,3.18 + 0.6 + 6.6],
    
    [11.45/2,3.18 + 0.6 + 6.6 + 2],

    [11.45/2,3.18 + 0.6 + 6.6 + 2 + 15.8],
    
    [16.6/2, 3.18 + 0.6 + 6.6 + 2 + 15.8 + 0.5],
    [16.6/2, 3.18 + 0.6 + 6.6 + 2 + 15.8 + 0.5 + 1],

    [11.45/2, 3.18 + 0.6 + 6.6 + 2 + 15.8 + 0.5 + 1 + 0.5],

    [11.7/2, 44.2],

    [0.0, 44.2]
    ];
    
e = 0.1;

topOfLedgeToPenTip = 7.17;
heightOfLedge = 0.75;
heightOfPenTip = topOfLedgeToPenTip - heightOfLedge;
heightOfPartAboveLedge = 5.3;
heightOfInkCanister = 27.25;
heightOfCap = 4.5;

CopicMultilinerTip = [              // X values = (measured diameter)/2, Y as distance from tip
    [0.0,0.0], [0.9/2,0.0],                      //  0 fiber pen tip
    [0.9/2, heightOfPenTip],            //  1 end of pen w/ tip
    [4.0/2, heightOfPenTip], [4.0 /2, heightOfPenTip + heightOfLedge],
    [(2.86 + e) / 2, heightOfPenTip + heightOfLedge], [(2.86 + e) / 2, heightOfPenTip + heightOfLedge + heightOfPartAboveLedge],        //  2 lip
    [(7.45 + e) / 2, heightOfPenTip + heightOfLedge + heightOfPartAboveLedge], [(7.45 + e) / 2, heightOfPenTip + heightOfLedge + heightOfPartAboveLedge + heightOfInkCanister],
    [(9.6 + e) / 2, heightOfPenTip + heightOfLedge + heightOfPartAboveLedge + heightOfInkCanister], [(9.6 + e) / 2, heightOfPenTip + heightOfLedge + heightOfPartAboveLedge + heightOfInkCanister + heightOfCap], 
    [0.0, heightOfPenTip + heightOfLedge + heightOfPartAboveLedge + heightOfInkCanister + heightOfCap]
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
            polygon(points=CopicMultilinerTip);
}

// HP plotter pen adapter body
module adapter_body() {
    render(convexity=3)
        rotate_extrude($fn=160)
            polygon(points=BodyOutline);
}

module koh_nor_adapter_body() {
    render(convexity=3)
        rotate_extrude($fn=160)
            polygon(points=KohINoorModel);
}


difference() {                             
    color ([1.0, 1.0, 1.0, 0.9]) koh_nor_adapter_body () ; 
    color ("blue") tip_body();
    // color ([1.0, 1.0, 1.0, 0.9]) koh_nor_adapter_body () ; 
}

