// Workbench

// Define some basics
// working in Imperial for this. Measurements are in inches. Le sigh.

Twox4W = 3.5;
Twox4H = 1.5;

Twox6W = 5.5;
Twox6H = 1.5;

WorkSurfaceW = 48;
WorkSurfaceL = 66;
WorkSurfaceH = 1;

RailLongLength = (WorkSurfaceL - ( 2 * Twox4H));
RailShortLength = (WorkSurfaceW - ( 1 * Twox4W));

PostShortLength = (40 - WorkSurfaceH);
PostLongLength = (40 + Twox6W - WorkSurfaceH);

BottomRailLowerHeight = 8;

echo("Cuts:");
echo("1 x Rail Long Length (2x6) = ", RailLongLength);
echo("3 x Rail Long Length (2x4) = ", RailLongLength);
echo("4 x Rail Short Length (2x4) = ", RailShortLength);
echo("");
echo("2 x Post Long Length (2x4) = ", PostLongLength);
echo("2 x Post Short Length (2x4) = ", PostShortLength);


// simple 2D -> 3D extrusion of a rectangle
// work surface
color("white")
    translate([0, 0, PostShortLength])
        linear_extrude(height = WorkSurfaceH)
            square([WorkSurfaceL, WorkSurfaceW], center = false);

// posts
color("red")
    translate([0,0,0])
        scale([Twox4H, Twox4W, PostShortLength])
            cube(1, center = false);

color("red")
    translate([Twox4H + RailLongLength,0,0])
        scale([Twox4H, Twox4W, PostShortLength])
            cube(1, center = false);

color("red")
    translate([0,Twox4W + RailShortLength,0])
        scale([Twox4H, Twox4W, PostShortLength])
            cube(1, center = false);

color("red")
    translate([Twox4H + RailLongLength,Twox4W + RailShortLength,0])
        scale([Twox4H, Twox4W, PostShortLength])
            cube(1, center = false);

// rails
// upper front
color("blue")
    translate([Twox4H, 0, PostShortLength - Twox4W])
        scale([RailLongLength, Twox4H, Twox4W])
            cube(1, center = false);

// lower front
color("green")
    translate([Twox4H, 0, BottomRailLowerHeight])
        scale([RailLongLength, Twox4H, Twox4W])
            cube(1, center = false);

// upper back
color("gold")
    translate([Twox4H, WorkSurfaceW, PostShortLength])
        scale([RailLongLength, Twox6H, Twox6W])
            cube(1, center = false);

// lower back
color("green")
    translate([Twox4H, WorkSurfaceW + Twox4W - Twox4H, BottomRailLowerHeight])
        scale([RailLongLength, Twox4H, Twox4W])
            cube(1, center = false);

// Upper left
color("yellow")
    translate([0,  Twox4W, PostShortLength - Twox4W])
        scale([Twox4H, RailShortLength, Twox4W])
            cube(1, center = false);

