$fn=36;

translate([-19,-9,1]) rotate([90,0,0]) pcb();
translate([0,0,99]) speaker();
translate([0,0,85.75]) ring();
translate([0,0,0]) lid();
translate([14.25,-14.4,0.6]) rotate([0,180,0]) switch_handler();
housing();

module housing() {
    difference() {
        union() {
            //body
            hull() {
                translate([18,-10,0]) cylinder(r=7, h=100);
                translate([-18,-10,0]) cylinder(r=7, h=100);
                translate([0,18,0]) cylinder(r=7, h=80);
                translate([0,0,99.9]) cylinder(r=26, h=0.1);
            }
            //tornillos tapa
            union() {
                translate([0,0,86]) for (i = [0:120:359]) {
                    rotate([0,0,i+60]) hull() {
                        cylinder(r=4, h=10);
                        translate([0,-30.75,0]) cylinder(r=4, h=10);
                    }
                }
            }
            //dientes
            union() {
                for (j = [0:29:80]) {
                    translate([0,0,j]) for (i = [0:120:359]) {
                        rotate([0,0,i+60]) hull() {
                            translate([-2.5,-35,0]) cube([5,15,0.1]);
                            translate([-0.5,-30,5]) rotate([0,90,0]) cylinder(r=3, h=1);
                            translate([-0.5,-25,5]) rotate([0,90,0]) cylinder(r=3, h=1);
                        }
                    }
                }
            }
        }
        union() {
            difference() {
                union() {
                    //interior
                    hull() {
                        translate([18,-10,1]) cylinder(r=5, h=100);
                        translate([-18,-10,1]) cylinder(r=5, h=100);
                        translate([0,18,1]) cylinder(r=5, h=80);
                        translate([0,0,100]) cylinder(r=24, h=0.1);
                    }
                    //portabaterías interior
                    union() {
                        translate([-10.75,-8.75,1]) cube([21.5,21.5,10]);
                    }
                    //rebaje interruptor
                    union() {
                        translate([10,-14.9,0.6]) cube([7, 7.5, 1]);
                    }
                    //conectores
                    union() {
                        translate([-16.75,-15,-1]) cube([9,5,3]);
                        translate([10,-12.9,-1]) cube([7,3.5,3]);
                    }
                    //hueco suelo
                    union() {
                        translate([0,0,-1]) hull() {
                            translate([0,14.5,0]) cylinder(r=3, h=3);
                            translate([10,0,0]) cylinder(r=3, h=3);
                            translate([-10,0,0]) cylinder(r=3, h=3);
                        }
                    }
                    //cortes laterales
                    translate([0,0,10]) for(i= [0:120:359]) {
                        rotate([0,0,i]) hull() {
                            rotate([90,0,0]) cylinder(r=3, h=25);
                            translate([15,0,10]) rotate([90,0,0]) cylinder(r=3, h=25);
                            translate([-15,0,10]) rotate([90,0,0]) cylinder(r=3, h=25);
                            translate([0,0,68]) rotate([90,0,0]) cylinder(r=3, h=25);
                            translate([15,0,58]) rotate([90,0,0]) cylinder(r=3, h=25);
                            translate([-15,0,58]) rotate([90,0,0]) cylinder(r=3, h=25);
                        }
                    }
                    //taladros montaje tapa
                    translate([0,0,85]) for (i = [0:120:359]) {
                        rotate([0,0,i]) translate([0,30.75,0]) cylinder(r=1.25, h=12);
                    }
                }
                //guias pcb
                union() {
                    translate([-20.25,-11.8,0]) cube([1,4, 80]);
                    translate([-25,-11.8,0]) cube([7,1, 80]);
                    translate([-25,-8.8,0]) cube([7,1, 80]);
                    translate([19.25,-10.8,0]) cube([1,2, 80]);
                    translate([18,-11.8,0]) cube([7,1, 80]);
                    translate([18,-8.8,0]) cube([7,1, 80]);
                }
                //guia bateria
                union() {
                    hull() {
                        translate([-0.5,18,0]) cube([1,7, 40]);
                        translate([-0.5,24,0]) cube([1,1, 80]);
                        translate([-0.5,15.5,30]) rotate([0,90,0]) cylinder(r=3, h=1);
                        translate([-0.5,15.5,50]) rotate([0,90,0]) cylinder(r=3, h=1);
                    }
                }
                //soporte anillo altavoz
                union() {
                    translate([0,0,81]) for(i = [0:120:359]) {
                        rotate([0,0,i]) hull() {
                            translate([-2.5,-23,0]) cube([5,0.1,0.1]);
                            translate([-2.5,-23,4.5]) cube([5,5,0.1]);
                        }
                    }
                }
            }
        }
    }
}

module switch_handler() {
    difference() {
        union() {
            cube([4,6.5,0.4]);
            translate([0,1.75,0]) cube([4,3,3]);
        }
        union() {
            translate([1.125,2.5,-1]) cube([1.75,1.5,2.75]);
            
        }
    }
}

module ring() {
    difference() {
        union() {
            cylinder(r=16, h=1.5);
            for(i = [0:120:359]) {
                rotate([0,0,i]) hull() {
                    translate([-4, -22, 0]) cube([8,9,1.5]);
                    translate([-4, -22, -4]) cube([8,1,4]);
                }
            }
        }
        union() {
            translate([0,0,-1]) cylinder(r=11.6, h=4);
            for(i = [0:120:359]) {
                rotate([0,0,i]) hull() {
                    translate([-2.75, -23, -5]) cube([5.5,12,5]);
                }
            }
        }
    }
}

module lid() {
    difference() {
        union() {
            //body
            hull() {
                translate([18,-10,0]) cylinder(r=7, h=102);
                translate([-18,-10,0]) cylinder(r=7, h=102);
                translate([0,18,0]) cylinder(r=7, h=80);
                translate([0,0,99.9]) cylinder(r=26, h=2.1);
            }
            //tornillos tapa
            union() {
                translate([0,0,96.25]) for (i = [0:120:359]) {
                    rotate([0,0,i+60]) hull() {
                        cylinder(r=4, h=5.75);
                        translate([0,-30.75,0]) cylinder(r=4, h=5.75);
                    }
                }
            }
        }
        union() {
            //altura
            union() {
                translate([0,0,-1]) cylinder(r=26, h=98);
            }
            //encaje altavoz
            union() {
                translate([0,0,94.75]) cylinder(r=20.15, h=4);
            }
            //silueta cuerpo
            difference() {
                hull() {
                    translate([18,-10,-1]) cylinder(r=7.25, h=101);
                    translate([-18,-10,-1]) cylinder(r=7.25, h=101);
                    translate([0,18,-1]) cylinder(r=7.25, h=81);
                    translate([0,0,99.9]) cylinder(r=26.25, h=0.1);
                }
                union() {
                    hull() {
                        translate([18,-10,1]) cylinder(r=4.75, h=100);
                        translate([-18,-10,1]) cylinder(r=4.75, h=100);
                        translate([0,18,1]) cylinder(r=4.75, h=80);
                        translate([0,0,100]) cylinder(r=23.75, h=0.1);
                    }
                }
            }
            //taladros altavoz
            union() {
                translate([0,0,98]) union() {
                    *for (i = [0:22.5:359]) rotate([0,0,i]) translate([17,0,0]) cylinder(r=1.75, h=4);
                    *for (i = [11.25:22.5:359]) rotate([0,0,i]) translate([11.5,0,0]) cylinder(r=1.75, h=4);
                    *for (i = [0:45:359]) rotate([0,0,i]) translate([6,0,0]) cylinder(r=1.75, h=4);
                    *cylinder(r=1.75, h=4);
                    cylinder(r=17.5, h=5);
                }
            }
            //taladros montaje tapa
            union() {
                translate([0,0,96]) for (i = [0:120:359]) {
                    rotate([0,0,i]) translate([0,30.75,2.5]) cylinder(r=3, h=4);
                    rotate([0,0,i]) translate([0,30.75,0]) cylinder(r=1.75, h=7);
                }
            }
        }
    }
}

module pcb() {
    union() {
        //pcb
        color("ForestGreen") cube([38,80,1.6]);
        //top side components
        translate([0,0,1.6]) union() {
            //SD
            translate([9.144, (80 - 10.16), 0]) rotate([0,0,90]) union() {
                color("wheat") translate([-8.5,-6.88,0]) cube([15,13.76,1.93]);
                color("grey") translate([-8.5,-6,0]) cube([15,10,1.95]);
                color("grey") translate([-3.5,-6,0]) cube([10,12,1.95]);
                color("silver") translate([-6,-6.88,0]) cube([11.6,13.9,2]);
                color("lightgray") for (i = [3.65-8.5, 11.95-8.5]) {
                    translate([-1 + i, -7.3, 0]) cube([2, 14.6, 0.2]);
                }
            }
            //USB
            translate([6.858, (80 - 75.184) ,0]) union() {
                color("silver") translate([-3.46,-5.7,0]) cube([6.92,9.2,3.96]);
                color("lightgray") for (i = [2.97-5.7, 8.45-5.7]) {
                    translate([-4.83, -0.75 + i, 0]) cube([9.66, 1.5, 0.2]);
                }
                color("lightgray") for (i = [-1.6:0.8:1.6]) {
                    translate([-0.25 + i, -5.7, 0]) cube([0.5, 9.8, 0.2]);
                }
            }
            //2x05 Conn
            translate([25.4, (80 - 23.368), 0]) translate([0,0,0]) for(i = [-2.54:1.27:2.54]) {
                color("gold") translate([-0.205 + i, -2.75, 0]) cube([0.41, 5.5, 0.41]);
                for(j = [-0.635:1.27:0.635]) {
                    color("gold") translate([-0.205 + i, -0.205 + j, 0]) cube([0.41, 0.41, 4.75]);
                    color("dimgrey") translate([-0.7 + i, -1.05 + j, 0.41]) cube([1.4, 2.1, 1.1]);
                }
            }
            //1x02 Conn
            translate([31.877, (80 - 54.356), 0]) for(i = [0:2.54:2.54]) {
                color("lightgray") translate([-0.32 + i, -0.32, -3.05]) cube([0.64, 0.64, 3.05 + 0.9]);
                color("lightgray") translate([-0.32 + i, -0.32, 0.9]) cube([0.64, 9.9, 0.64]);
                color("dimgrey") translate([-1.22 + i, -1.22 + 1.52, 0]) cube([2.44, 2.54, 2.44]);
            }
            //PTS636
            translate([3.556, (80 - 45.72),0]) rotate([0,0,90]) union() {
                color("grey") translate([-3, -1.75, 0]) cube([6, 3.5, 3.2]);
                color("silver") translate([-3, -1.75, 3.2]) cube([6, 3.5, 0.1]);
                color("grey") translate([-1.5, -0.75, 0]) cube([3, 1.5, 5]);
                color("lightgray") for (i = [-3.1, 3.1]) {
                    translate([i - 0.1, -0.5, -3.9]) cube([0.2, 1, 4.7]);
                }
            }
            //PCM12
            translate([32.512, (80 - 77.724), 0]) union() {
                color("silver") translate([-3.35, -1.3, 0]) cube([6.7, 2.6, 1.4]);
                color("grey") translate([-0.65 + 0.75, -1.5 - 1.3, 0]) cube([1.3, 1.5, 1.1]); //OFF
                color("grey") translate([-0.65 - 0.75, -1.5 - 1.3, 0]) cube([1.3, 1.5, 1.1]); //ON
                color("lightgray") for (i = [-1.09, 1.09]) {
                    translate([-3.65, i - 0.2, 0]) cube([7.3, 0.4, 0.2]);
                }
                color("lightgray") for (i = [-2.25, 0.75, 2.25]) {
                    translate([i - 0.2, -1.29, 0]) cube([0.4, 3.5, 0.2]);
                }
            }
            //QFP48
            translate([19.304, (80 - 33.528), 0]) union() {
                color("dimgrey") translate([-3.5, -3.5, 0]) cube([7, 7, 1.2]);
                color("lightgray") for (i = [-3:0.5:2.9]) {
                    translate([-4.5, i + 0.135, 0]) cube([9, 0.27, 0.6]);
                }
                color("lightgray") for (i = [-3:0.5:2.9]) {
                    translate([i + 0.135, -4.5, 0]) cube([0.27, 9, 0.6]);
                }
            }
            //QFN16
            translate([21.336, (80 - 50.292), 0]) union() {
                color("dimgrey") translate([-1.5, -1.5, 0]) cube([3, 3, 0.75]);
                color("lightgray") for (i = [-0.75, -0.25, 0.25, 0.75]) {
                    translate([-1.55, i - 0.115, 0]) cube([3.1, 0.23, 0.2]);
                }
                color("lightgray") for (i = [-0.75, -0.25, 0.25, 0.75]) {
                    translate([i - 0.115, -1.55, 0]) cube([0.23, 3.1, 0.2]);
                }
            }
            //LGA16
            translate([30.637, (80 - 10.087), 0]) union() {
                color("dimgrey") translate([-1.5, -1.5, 0]) cube([3, 3, 0.85]);
            }
            //SOIC8
            translate([16.764, (80 - 69.088), 0]) union() {
                color("dimgrey") translate([-1.95, -2.45, 0]) cube([3.9, 4.9, 1.75]);
                color("lightgray") for (i = [-1.905, -0.635, 0.635, 1.905]) {
                    translate([-3.05, i - 0.255, 0]) cube([6.1, 0.51, 1.13]);
                }
            }
            //SOIC8 WIDE
            translate([10.16, (80 - 47.752), 0]) rotate([0,0,90]) union() {
                color("dimgrey") translate([-2.65, -2.65, 0]) cube([5.3, 5.3, 1.75]);
                color("lightgray") for (i = [-1.905, -0.635, 0.635, 1.905]) {
                    translate([-3.75, i - 0.255, 0]) cube([7.5, 0.51, 1.13]);
                }
            }
            //SOT23-6
            for (i = [ [3.048, (80 - 67.056), 0], [25.4, (80 - 60.452), 0] ]) {
                translate(i) rotate([0,0,90]) union() {
                    color("dimgrey") translate([-0.875, -1.525, 0]) cube([1.75, 3.05, 1.1]);
                    color("lightgray") for (i = [-0.95, 0,0.95]) {
                        translate([-1.525, i - 0.25, 0]) cube([3.05, 0.5, 0.6]);
                    }
                }
            }
            //SOT23-5
            translate([31.496, (80 - 60.452), 0]) rotate([0,0,90]) union() {
                color("dimgrey") translate([-0.875, -1.525, 0]) cube([1.75, 3.05, 1.1]);
                color("lightgray") for (i = [-0.95, 0.95]) {
                    translate([0, i - 0.25, 0]) cube([1.525, 0.5, 0.6]);
                }
                color("lightgray") for (i = [-0.95, 0, 0.95]) {
                    translate([-1.525, i - 0.25, 0]) cube([1.525, 0.5, 0.6]);
                }
            }
            //SOD-123 D
            translate([16.764, (80 - 65.024), 0]) union() {
                color("dimgrey") translate([-1.425, -0.9, 0]) cube([2.85, 1.8, 1.17]);
                color("lightgray") translate([-1.95, -0.35, 0]) cube([3.9, 0.7, 0.585]);
            }
            //0805 LED
            for (i = [ [3.556, (80 - 61.976), 0], [3.556, (80 - 57.912), 0] ]) {
                translate(i) union() {
                    color("palegreen") translate([-0.6, -0.625, 0.3]) cube([1.2, 1.25, 0.5]);
                    color("ivory") translate([-0.6, -0.625, 0]) cube([1.2, 1.25, 0.3]);
                    color("lightgray") for (i = [-0.8, 0.8]) {
                        translate([i - 0.2, -0.625, 0]) cube([0.4, 1.25, 0.35]);
                    }
                }
            }
            translate([3.556, (80 - 59.944), 0]) union() {
                color("coral") translate([-0.6, -0.625, 0.3]) cube([1.2, 1.25, 0.5]);
                color("ivory") translate([-0.6, -0.625, 0]) cube([1.2, 1.25, 0.3]);
                color("lightgray") for (i = [-0.8, 0.8]) {
                    translate([i - 0.2, -0.625, 0]) cube([0.4, 1.25, 0.35]);
                }
            }
            translate([3.556, (80 - 53.848), 0]) union() {
                color("lightsalmon") translate([-0.6, -0.625, 0.3]) cube([1.2, 1.25, 0.5]);
                color("ivory") translate([-0.6, -0.625, 0]) cube([1.2, 1.25, 0.3]);
                color("lightgray") for (i = [-0.8, 0.8]) {
                    translate([i - 0.2, -0.625, 0]) cube([0.4, 1.25, 0.35]);
                }
            }
            //XTAL
            translate([12.192, (80 - 28.448), 0]) rotate([0,0,90]) color("dimgrey") translate([-1.6, -0.75, 0]) cube([3.2, 1.5, 0.8]);
            //0805 R
            for (i = [ [3.556, (80 - 64.008), 0], [3.556, (80 - 55.88), 0], [9.652, (80 - 53.848), 0], [3.556, (80 - 51.816), 0], [32.512, (80 - 17.78), 0], [32.512, (80 - 15.748), 0] ]) {
                translate(i) union() {
                    color("slategray") translate([-0.775, -0.625, 0]) cube([1.55, 1.25, 0.5]);
                    color("lightgray") for (i = [-0.825, 0.825]) {
                        translate([i - 0.175, -0.65, 0]) cube([0.35, 1.3, 0.55]);
                    }
                }
            }
            for (i = [ [13.716, (80 - 76.2), 0], [30.988, (80 - 72.644), 0], [11.684, (80 - 68.072), 0], [30.988, (80 - 67.564), 0], [18.288, (80 - 60.452), 0], [20.32, (80 - 60.452), 0], [22.352, (80 - 60.452), 0], [16.764, (80 - 52.832), 0] ]) {
                translate(i) rotate([0,0,90]) union() {
                    color("slategray") translate([-0.775, -0.625, 0]) cube([1.55, 1.25, 0.5]);
                    color("lightgray") for (i = [-0.825, 0.825]) {
                        translate([i - 0.175, -0.65, 0]) cube([0.35, 1.3, 0.55]);
                    }
                }
            }
            //0805 C
            for (i = [ [16.764, (80 - 73.152), 0], [19.812, (80 - 54.356), 0], [23.368, (80 - 54.356), 0], [27.432, (80 - 54.356), 0], [27.432, (80 - 48.26), 0], [18.796, (80 - 40.64), 0], [9.144, (80 - 29.972), 0], [9.144, (80 - 26.924), 0], [19.304, (80 - 26.416), 0], [19.304, (80 - 24.384), 0] ]) {
                translate(i) union() {
                    color("tan") translate([-0.8, -0.625, 0]) cube([1.6, 1.25, 1]);
                    color("lightgray") for (i = [-0.775, 0.775]) {
                        translate([i  -0.125, -0.65, 0]) cube([0.25, 1.3, 1.05]);
                    }
                }
            }
            for (i = [ [15.748, (80 - 76.2), 0], [22.352, (80 - 76.2), 0], [24.384, (80 - 76.2), 0], [26.416, (80 - 76.2), 0], [15.24, (80 - 60.452), 0], [28.448, (80 - 60.452), 0], [14.224, (80 - 50.8), 0], [12.192, (80 - 33.02), 0], [26.416, (80 - 29.972), 0], [16.256, (80 - 25.4), 0], [17.526, (80 - 10.922), 0], [31.496, (80 - 4.572), 0], [33.528, (80 - 4.572), 0] ]) {
                translate(i) rotate([0,0,90]) union() {
                    color("tan") translate([-0.8, -0.625, 0]) cube([1.6, 1.25, 1]);
                    color("lightgray") for (i = [-0.775, 0.775]) {
                        translate([i  -0.125, -0.65, 0]) cube([0.25, 1.3, 1.05]);
                    }
                }
            }
            //3528 C TANT
            translate([12.192, (80 - 61.468), 0]) rotate([0,0,90]) union() {
                color("orange") translate([-1.75, -1.4, 0]) cube([3.5, 2.8, 1.9]);
                color("darkorange") translate([-1.75, -1.45, 0]) cube([0.5, 2.9, 1.95]);
                color("lightgray") for (i = [-1.4, 1.4]) {
                    translate([i  -0.4, -1.1, 0]) cube([0.8, 2.2, 0.95]);
                }
            }
            //0805 L
            for (i = [ [27.432, (80 - 52.324), 0], [27.432, (80 - 50.292), 0] ]) {
                translate(i) union() {
                    color("darkgray") translate([-0.775, -0.625, 0]) cube([1.55, 1.25, 0.5]);
                    color("lightgray") for (i = [-0.825, 0.825]) {
                        translate([i - 0.175, -0.65, 0]) cube([0.35, 1.3, 0.55]);
                    }
                }
            }
            //8040 L
            translate([25.4, (80 - 69.088), 0]) union() {
                color("darkgray") translate([-4, -4, 0]) cube([8, 8, 0.5]);
                color("dimgrey") translate([-3.5, -3.5, 0.5]) cube([7, 7, 2.5]);
                color("darkgray") translate([-4, -4, 3]) cube([8, 8, 0.5]);
            }
        }
        //bottom side components
        union() {
            //battery holder
            translate([19, 40, 0]) rotate([0,180,90]) union() {
                difference() {
                    union() {
                        color("grey") translate([-38.85,-10.5,0]) cube([77.7,21,21.5]);
                    }
                    union() {
                        difference() {
                            color("grey") union() {
                                translate([-37.325,-11.5, 15]) cube([74.65,23,7.5]);
                                translate([-23.25,-11.5, 11]) cube([46.5,23,11]);
                                translate([-12.75,-11.5, 7]) cube([25.5,23,15]);
                                translate([-37.325,0,11.6]) hull() {
                                    rotate([0,90,0]) cylinder(r=9.25, h=74.65, $fn=12);
                                    translate([0,0,5]) rotate([0,90,0]) cylinder(r=9.25, h=74.65, $fn=12);
                                }
                            }
                            union() {
                                color("lightgray") translate([-38,-3.25,0]) cube([5,6.5,16.5]);
                                color("lightgray") translate([34.1,-3.25,0]) cube([5,6.5,16.5]);
                            }
                        }
                    }
                }
                color("lightgray") translate([-0.25-36,-0.8,-3.4]) cube([0.5,1.6,3.4]);
                color("lightgray") translate([-0.25+36,-0.8,-3.4]) cube([0.5,1.6,3.4]);
            }
            //battery
            translate([19,40,-12.1]) union() {
                color("hotpink") translate([0,32.85,0]) rotate([90,0,0]) cylinder(r=9.25, h=65.7, $fn=12);
                color("lightgray") translate([0,32.9,0]) rotate([90,0,0]) cylinder(r1=6.75, r2=4.5, h=65.7+1.2, $fn=12);
            }
        }
    }
}

module speaker() {
    difference() {
        union() {
            color("silver") translate([0,0,-2.2]) cylinder(r=20, h=2.2, $fn=36);
            color("silver") translate([0,0,-11.5]) cylinder(r1=16.25, r2=18.5, h=9.3, $fn=36);
            color("silver") translate([0,0,-17.5]) cylinder(r=11.5, h=6, $fn=36);
        }
        union() {
            color("silver") for(i = [45:90:359]) {
                rotate([0,0,i]) translate([-7.5,10,-8.5]) cube([15, 8.5, 5]);
            }
            color("grey") translate([0,0,-0.01]) cylinder(r=19.9, h=2, $fn=36);
            color("grey") translate([0,0,-1.9]) difference() {
                cylinder(r=18, h=2, $fn=36);
                translate([0,0,-1]) cylinder(r=17.8, h=4, $fn=36);
            }
            color("grey") translate([0,0,-4]) difference() {
                cylinder(r1=8.5, r2=13.5, h=4, $fn=36);
                translate([0,0,-6]) sphere(r=10, $fn=12);
            }
        }
    }
    color("wheat") translate([-8,-18,-8.5]) cube([16,1,5]);
    color("lightgray") for(i = [-8.5, 8.5]) {
        translate([-3.5+i,-20,-7.75]) cube([7,2,3.5]);
    }
}