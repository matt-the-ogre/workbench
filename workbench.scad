// Workbench

// Define some basics
// working in Imperial for this. Measurements are in inches. Le sigh.

Twox4W = 3.5;
Twox4H = 1.5;

Twox6W = 5.5;
Twox6H = 1.5;

HorizontalOffset = 4.0;

WorkSurfaceW = 48;
WorkSurfaceL = 66;
WorkSurfaceH = 1;

RailLongLength = (WorkSurfaceL - ( 2 * Twox4H ) - ( 2 * HorizontalOffset ));
RailShortLength = (WorkSurfaceW - ( 1 * Twox4W ) - ( 1 * HorizontalOffset ));

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
// front left
color("red")
    translate([HorizontalOffset, HorizontalOffset, 0])
        scale([Twox4H, Twox4W, PostShortLength])
            cube(1, center = false);

// front right
color("red")
    translate([Twox4H + RailLongLength + HorizontalOffset, HorizontalOffset, 0])
        scale([Twox4H, Twox4W, PostShortLength])
            cube(1, center = false);

// back left
color("red")
    translate([HorizontalOffset, Twox4W + RailShortLength + 
HorizontalOffset, 0])
        scale([Twox4H, Twox4W, PostLongLength])
            cube(1, center = false);

// back right
color("red")
    translate([Twox4H + RailLongLength + HorizontalOffset, Twox4W + RailShortLength + 
HorizontalOffset, 0])
        scale([Twox4H, Twox4W, PostLongLength])
            cube(1, center = false);

// rails
// upper front
color("blue")
    translate([Twox4H + HorizontalOffset, HorizontalOffset, PostShortLength - Twox4W])
        scale([RailLongLength, Twox4H, Twox4W])
            cube(1, center = false);

// lower front
color("green")
    translate([Twox4H + HorizontalOffset, HorizontalOffset, BottomRailLowerHeight])
        scale([RailLongLength, Twox4H, Twox4W])
            cube(1, center = false);

// upper back
color("gold")
    translate([Twox4H + HorizontalOffset, WorkSurfaceW, PostShortLength])
        scale([RailLongLength, Twox6H, Twox6W])
            cube(1, center = false);

// lower back
color("green")
    translate([Twox4H + HorizontalOffset, WorkSurfaceW + Twox4W - Twox4H, BottomRailLowerHeight])
        scale([RailLongLength, Twox4H, Twox4W])
            cube(1, center = false);

// upper left
color("yellow")
    translate([HorizontalOffset, Twox4W + HorizontalOffset, PostShortLength - Twox4W])
        scale([Twox4H, RailShortLength, Twox4W])
            cube(1, center = false);

// upper right
color("yellow")
    translate([Twox4H + RailLongLength + HorizontalOffset,  Twox4W + HorizontalOffset, PostShortLength - Twox4W])
        scale([Twox4H, RailShortLength, Twox4W])
            cube(1, center = false);

// lower left
color("yellow")
    translate([HorizontalOffset, Twox4W + HorizontalOffset, BottomRailLowerHeight])
        scale([Twox4H, RailShortLength, Twox4W])
            cube(1, center = false);

// lower right
color("yellow")
    translate([Twox4H + RailLongLength + HorizontalOffset,  Twox4W + HorizontalOffset, BottomRailLowerHeight])
        scale([Twox4H, RailShortLength, Twox4W])
            cube(1, center = false);

