$fn=36;

case();

module case() {
    difference() {
        union() {
            cylinder(r=22, h=100);
        }
        union() {
            translate([0,0,1]) cylinder(r=20, h=100);
            translate([0,0,-1]) union() {
                for (i = [0:22.5:359]) rotate([0,0,i]) translate([17,0,0]) cylinder(r=1.75, h=3);
                for (i = [11.25:22.5:359]) rotate([0,0,i]) translate([11.5,0,0]) cylinder(r=1.75, h=3);
                for (i = [0:45:359]) rotate([0,0,i]) translate([6,0,0]) cylinder(r=1.75, h=3);
                cylinder(r=1.75, h=3);
            }
        }
    }
}
