$fn=36;

translate([-19,-8.8,2]) rotate([90,0,0]) pcb();
translate([0,0,110.5]) rotate([0,0,15]) speaker();
translate([0,0,97.25]) ring();
translate([-10,-15,92]) color("ivory") cube([20,30,1]); //foam
translate([0,0,108.5]) lid();
translate([7,-18,2]) switch_fastening_sup();
translate([19,-3,2]) switch_fastening_inf();
translate([14.25-2,-14.4+3.25-0.2,2]) rotate([0,180,0]) switch_handler();
housing("");

module housing(serial) {
    difference() {
        union() {
            //body
            translate([0,0,0]) cylinder(r=28, h=111.5);
        }
        union() {
            *translate([0,0,10]) cylinder(r=35, h=120);
            *translate([-40,-40,-1]) cube([40,70,120]);
            *translate([0,-40,-1]) cube([40,70,120]);
            difference() {
                union() {
                    //interior
                    translate([0,0,2]) cylinder(r=26, h=111);
                    //rebaje interruptor
                    translate([10,-17.1,1.6]) cube([6.25, 12, 1]);
                    //fijacion interruptor
                    translate([7,-18,-1]) cylinder(r=0.7, h=5);
                    translate([19,-3,-1]) cylinder(r=0.7, h=5);
                    //conectores
                    union() {
                        translate([-4.5,-15.2,-1]) cube([9,5,5]);
                        translate([10,-13.1,-1]) cube([6.25,3.5,5]);
                        translate([-14.52,-11.35,-1]) cylinder(r=0.7, h=5);
                    }
                    //hueco suelo
                    for(i = [30:120:359]) {
                        hull() {
                            rotate([0,0,i-7.5]) translate([21,0,-1]) cylinder(r=2, h=5);
                            rotate([0,0,i+7.5]) translate([21,0,-1]) cylinder(r=2, h=5);
                        }
                    }
                    translate([0,20,-1]) difference() {
                        hull() {
                            translate([9,0,0]) cylinder(r=1, h=5);
                            translate([6,-2,0]) cylinder(r=1, h=5);
                            translate([-6,2,0]) cylinder(r=1, h=5);
                            translate([-9,0,0]) cylinder(r=1, h=5);
                            translate([6,2,0]) cylinder(r=1, h=5);
                            translate([-6,-2,0]) cylinder(r=1, h=5);
                        }
                        translate([-1,-5,1]) cube([2,10,2]);
                    }
                    //numeracion
                    translate([0.75,6,-1]) mirror([1,0,0]) rotate([0,0,180]) linear_extrude(5) text(str(serial), font="onlywhenidofonts", size=16, valign="center", halign="center");
                    //cortes laterales
                    translate([0,0,10]) for(i= [0:120:359]) {
                        rotate([0,0,i]) hull() {
                            rotate([90,0,0]) cylinder(r=3, h=30);
                            translate([15,0,15]) rotate([90,0,0]) cylinder(r=3, h=30);
                            translate([-15,0,15]) rotate([90,0,0]) cylinder(r=3, h=30);
                            translate([0,0,74.5]) rotate([90,0,0]) cylinder(r=3, h=30);
                            translate([15,0,59.5]) rotate([90,0,0]) cylinder(r=3, h=30);
                            translate([-15,0,59.5]) rotate([90,0,0]) cylinder(r=3, h=30);
                        }
                    }
                    //marca pegatina
                    translate([0,27.5,-1]) rotate([0,0,45]) cube([1,1,113]);
                }
                union() {
                    //torres tornillos tapa
                    difference() {
                        translate([0,0,98]) for (i = [30:120:359]) {
                            rotate([0,0,i]) hull() {
                                translate([0,22.875,5]) cylinder(r=3, h=5);
                                translate([0,27,5]) cylinder(r=3, h=5);
                                translate([0,27,-3]) cylinder(r=1, h=1);
                            }
                            
                        }
                        translate([0,0,98]) for (i = [30:120:359]) {
                            rotate([0,0,i]) translate([0,22.875,4]) cylinder(r=1.25, h=7);
                        }
                    }
                    //tornillo fastener
                    translate([7,-18,0]) difference() {
                        cylinder(r=1.5, h=3);
                        translate([0,0,-1]) cylinder(r=0.7, h=5);
                    }
                    translate([19,-3,0]) difference() {
                        cylinder(r=1.5, h=3);
                        translate([0,0,-1]) cylinder(r=0.7, h=5);
                    }
                    translate([8,-6,0]) cylinder(r=1.5, h=3);
                    //proteccion reset
                    difference() {
                        translate([-14.52,-11.65,1]) scale([1,0.6,1]) cylinder(r=2.5, h=3);
                        union() {
                            translate([-14.52,-11.65,0]) scale([1,0.6,1]) cylinder(r=1.5, h=5);
                            translate([-17,-11.5,0]) cube([5,5,5]);
                        }
                    }
                    //reflector led
                    translate([-12.5,-15,0]) cube([5,2,6]);
                    //guias pcb
                    difference() {
                        union() {
                            translate([-20.25,-12,0]) cube([1,4.4, 92]);
                            translate([-25,-12,0]) cube([7,1, 92]);
                            translate([-25,-8.6,0]) cube([7,1, 92]);
                            translate([19.25,-12,0]) cube([1,4.4, 92]);
                            translate([18,-12,0]) cube([7,1, 92]);
                            translate([18,-8.6,0]) cube([7,1, 92]);
                        }
                        union() {
                            translate([21.5,-8.4,80]) rotate([0,270,270]) linear_extrude(1) text("2mm", size=7, valign="center", halign="center");
                        }
                    }
                    //guia bateria
                    union() {
                        hull() {
                            translate([-1,17.5,1]) cube([2,10, 40]);
                            translate([-1,25.5,1]) cube([2,2, 92]);
                            translate([-1,15.5,31]) rotate([0,90,0]) cylinder(r=3, h=2);
                            translate([-1,15.5,71]) rotate([0,90,0]) cylinder(r=3, h=2);
                        }
                    }
                    //soporte anillo altavoz
                    union() {
                        translate([0,0,91.25]) for(i = [0:120:359]) {
                            rotate([0,0,i]) hull() {
                                translate([-2.5,-27,-2]) cube([5,0.1,0.1]);
                                translate([-2.5,-28,5.5]) cube([5,9,0.1]);
                            }
                        }
                    }
                }
            }
        }
    }
}

module switch_fastening_sup() {
    difference() {
        union() {
            intersection() {
                union() {
                    translate([-3,-8.2,0]) cube([17,13.5,4]);
                    translate([11,0.8,0]) cube([5,5,4]);
                }
                translate([-7,18,0]) cylinder(r=25.75, h=4);
            }
        }
        union() {
            translate([2.75,0.8,-1]) cube([6.75,5,1.4]);
            translate([-4.25,2.75,-1]) cube([2,3,6]);
            translate([0,0,-1]) cylinder(r=1.65, h=2.25);
            translate([-7,-21-2.5,-1]) hull() {
                rotate([0,0,-7.5]) translate([0,21,0]) cylinder(r=2.25, h=6);
                rotate([0,0,7.5]) translate([0,21,0]) cylinder(r=2.25, h=6);
            }
            translate([0,0,1]) union() {
                cylinder(r=1.2,h=5);
                translate([0,0,1.7]) cylinder(r1=1.2,r2=2,h=1.8);
                *translate([0,0,3.45]) cylinder(r=2,h=2);
            }
        }
    }
}

module switch_fastening_inf() {
    difference() {
        union() {
            intersection() {
                union() {
                    translate([-13.5,-4.4,0]) cube([21,3.8,4]);
                    translate([-5,-1,0]) cube([13,3.5,4]);
                    translate([-13.5,-5.5,0]) cube([12.25,2,4]);
                }
                translate([-19,3,0]) cylinder(r=25.75, h=4);
            }
        }
        union() {
            translate([-9.25,-6.95,-1]) cube([6.75,5,1.4]);
            translate([0,0,-1]) cylinder(r=1.65, h=2.25);
            translate([-11,-3,-1]) cylinder(r=1.65, h=2.25);
            translate([0,0,1]) union() {
                cylinder(r=1.2,h=5);
                translate([0,0,1.7]) cylinder(r1=1.2,r2=2,h=1.8);
                *translate([0,0,3.45]) cylinder(r=2,h=2);
            }
        }
    }
}

module switch_handler() {
    difference() {
        union() {
            translate([-2,-5.25,0]) cube([4,11,0.4]);
            intersection() {
                translate([-2,1.75-3.25,0]) cube([4,3,4]);
                translate([0,1.5,-1]) rotate([90,0,0]) cylinder(r=5, h=3);
            }
        }
        union() {
            translate([-0.875,-0.75,-1]) cube([1.75,1.5,2.75]);
        }
    }
}

module ring() {
    difference() {
        union() {
            translate([0,0,-1]) cylinder(r=22, h=2.5);
            for(i = [0:120:359]) {
                rotate([0,0,i]) hull() {
                    translate([-4, -25, -1]) cube([8,14,2.5]);
                    translate([-4, -25, -5]) cube([8,1,5]);
                }
            }
        }
        union() {
            translate([0,0,-2]) cylinder(r=11.7, h=5);
            for(i = [-17,46]) {
                rotate([0,0,i]) hull() {
                    translate([0,-19,-4]) cylinder(r=1.25, h=6);
                    translate([0,-25,-4]) cylinder(r=1.25, h=6);
                }
            } 
            for(i = [0:120:359]) {
                rotate([0,0,i]) translate([-2.75, -26, -6]) cube([5.5,15,6]);
            }
            for (i = [30:120:359]) {
                rotate([0,0,i]) translate([0,22.875,-2]) cylinder(r=4, h=5);
            }
        }
    }
}

module lid() {
    difference() {
        union() {
            //body
            translate([0,0,0]) cylinder(r=28, h=5);
        }
        union() {
            //recorte profundidad
            translate([0,0,-1.25]) cylinder(r=26, h=1.25);
            //encaje altavoz
            translate([0,0,-2.25]) cylinder(r=20.25, h=4);
            translate([0,0,-1]) cylinder(r=17.5, h=5);
            //silueta cuerpo
            difference() {
                translate([0,0,-1]) cylinder(r=28.25, h=4);
                translate([0,0,-2]) cylinder(r=25.75, h=6);
            }
            //taladro altavoz
            translate([0,0,1]) cylinder(r=1.5, h=5);
            for(i = [0:20:359]) {
                rotate([0,0,i]) translate([16,0,1]) cylinder(r=1.5, h=5);
                rotate([0,0,i+10]) translate([12,0,1]) cylinder(r=1.5, h=5);
            }
            for(i = [0:30:359]) {
                rotate([0,0,i]) translate([8,0,1]) cylinder(r=1.5, h=5);
            }
            for(i = [0:60:359]) {
                rotate([0,0,i]) translate([4,0,1]) cylinder(r=1.5, h=5);
            }
            //taladros montaje tapa
            union() {
                for (i = [0:120:359]) {
                    rotate([0,0,i]) translate([0,22.875,5]) cylinder(r=3, h=2);
                    rotate([0,0,i]) translate([0,22.875,3.1]) cylinder(r1=1.75, r2=3, h=2);
                    rotate([0,0,i]) translate([0,22.875,-1]) cylinder(r=1.75, h=8);
                }
            }
        }
    }
}

module pcb() {
    union() {
        //pcb
        color("ForestGreen") cube([38,90,2]);
        //top side components
        translate([0,0,2]) union() {
            //SD
            translate([9.652, (90 - 48.768), 0]) rotate([0,0,90]) union() {
                color("wheat") translate([-8.5,-6.88,0]) cube([15,13.76,1.93]);
                color("grey") translate([-8.5,-6,0]) cube([15,10,1.95]);
                color("grey") translate([-3.5,-6,0]) cube([10,12,1.95]);
                color("silver") translate([-6,-6.88,0]) cube([11.6,13.9,2]);
                color("lightgray") for (i = [3.65-8.5, 11.95-8.5]) {
                    translate([-1 + i, -7.3, 0]) cube([2, 14.6, 0.2]);
                }
            }
            //USB
            translate([19, (90 - 85.184) ,0]) union() {
                color("silver") translate([-3.46,-5.7,0]) cube([6.92,9.2,3.96]);
                color("lightgray") for (i = [2.97-5.7, 8.45-5.7]) {
                    translate([-4.83, -0.75 + i, 0]) cube([9.66, 1.5, 0.2]);
                }
                color("lightgray") for (i = [-1.6:0.8:1.6]) {
                    translate([-0.25 + i, -5.7, 0]) cube([0.5, 9.8, 0.2]);
                }
            }
            //2x05 Conn
            translate([19.05, (90 - 12.192), 0]) rotate([0,0,90]) for(i = [-2.54:1.27:2.54]) {
                color("gold") translate([-0.205 + i, -2.75, 0]) cube([0.41, 5.5, 0.41]);
                for(j = [-0.635:1.27:0.635]) {
                    color("gold") translate([-0.205 + i, -0.205 + j, 0]) cube([0.41, 0.41, 4.75]);
                    color("dimgrey") translate([-0.7 + i, -1.05 + j, 0.41]) cube([1.4, 2.1, 1.1]);
                }
            }
            //1x02 Conn
            translate([32.004, (90 - 54.102), 0]) for(i = [0:2.54:2.54]) {
                color("lightgray") translate([-0.32 + i, -0.32, -3.05]) cube([0.64, 0.64, 3.05 + 0.9]);
                color("lightgray") translate([-0.32 + i, -0.32, 0.9]) cube([0.64, 9.9, 0.64]);
                color("dimgrey") translate([-1.22 + i, -1.22 + 1.52, 0]) cube([2.44, 2.54, 2.44]);
            }
            //EVQ
            translate([4.572, (90 - 86.36),0]) union() {
                color("silver") translate([-1.75, -1.45, 0]) cube([3.5, 2.9, 1.35]);
                color("grey") translate([-0.85, -1.45-.45, 0]) cube([1.7, 0.45, 1.1]);
                color("lightgray") for (i = [-0.74, 0.74]) {
                    translate([-2.35, i - 0.25, 0]) cube([4.7, 0.5, 0.2]);
                }
            }
            //PCM12
            translate([32.512, (90 - 87.724), 0]) union() {
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
            translate([19.05, (90 - 28.194), 0]) union() {
                color("dimgrey") translate([-3.5, -3.5, 0]) cube([7, 7, 1.2]);
                color("lightgray") for (i = [-3:0.5:2.9]) {
                    translate([-4.5, i + 0.135, 0]) cube([9, 0.27, 0.6]);
                }
                color("lightgray") for (i = [-3:0.5:2.9]) {
                    translate([i + 0.135, -4.5, 0]) cube([0.27, 9, 0.6]);
                }
            }
            //QFN16
            translate([23.114, (90 - 50.292), 0]) union() {
                color("dimgrey") translate([-1.5, -1.5, 0]) cube([3, 3, 0.75]);
                color("lightgray") for (i = [-0.75, -0.25, 0.25, 0.75]) {
                    translate([-1.55, i - 0.115, 0]) cube([3.1, 0.23, 0.2]);
                }
                color("lightgray") for (i = [-0.75, -0.25, 0.25, 0.75]) {
                    translate([i - 0.115, -1.55, 0]) cube([0.23, 3.1, 0.2]);
                }
            }
            //LGA16
            translate([30.637, (90 - 10.087), 0]) union() {
                color("dimgrey") translate([-1.5, -1.5, 0]) cube([3, 3, 0.85]);
            }
            //VQFN7
            translate([19.573, (90 - 67.31), 0]) union() {
                color("dimgrey") translate([-1, -1, 0]) cube([2, 2, 0.85]);
            }
            //SON6
            for(i = [ [10.16, (90 - 7.62), 0], [7.112, (90 - 7.62), 0] ]) {
                translate(i) union() {
                    color("dimgrey") translate([-1, -1, 0]) cube([2, 2, 0.85]);
                }
            }
            //WSON6
            translate([7.874, (90 - 4.572), 0]) union() {
                color("dimgrey") translate([-0.75, -0.75, 0]) cube([1.5, 1.5, 0.8]);
            }
            //SOT23-6
            for (i = [ [13.208, (90 - 77.724), 0] ]) {
                translate(i) rotate([0,0,90]) union() {
                    color("dimgrey") translate([-0.875, -1.525, 0]) cube([1.75, 3.05, 1.1]);
                    color("lightgray") for (i = [-0.95, 0,0.95]) {
                        translate([-1.525, i - 0.25, 0]) cube([3.05, 0.5, 0.6]);
                    }
                }
            }
            //SOT23-5
            translate([27.432, (90 - 72.136), 0]) union() {
                color("dimgrey") translate([-0.875, -1.525, 0]) cube([1.75, 3.05, 1.1]);
                color("lightgray") for (i = [-0.95, 0.95]) {
                    translate([0, i - 0.25, 0]) cube([1.525, 0.5, 0.6]);
                }
                color("lightgray") for (i = [-0.95, 0, 0.95]) {
                    translate([-1.525, i - 0.25, 0]) cube([1.525, 0.5, 0.6]);
                }
            }
            //SOT223-3
            translate([9.398, (90 - 67.818), 0]) union() {
                color("dimgrey") translate([-3.25, -1.75, 0]) cube([6.5, 3.5, 1.8]);
                color("lightgray") translate([-1.525, 1.75, 0]) cube([3.05, 1.75, 0.8]);
                color("lightgray") for (i = [-2.3, 0, 2.3]) {
                    translate([i - 0.375, -3.5, 0]) cube([0.75, 1.75, 0.8]);
                }
            }
            //0402 LED
            translate([9.144, (90 - 88.392)]) union() {
                color("palegreen") translate([-0.4, -0.25, 0.1]) cube([0.8, 0.5, 0.35]);
                color("ivory") translate([-0.4, -0.25, 0]) cube([0.8, 0.5, 0.1]);
                color("lightgray") for (i = [-0.3, 0.3]) {
                    translate([i - 0.2, -0.25, 0]) cube([0.4, 0.5, 0.15]);
                }
            }
            translate([25.654, (90 - 88.392)]) rotate([0,0,90]) union() {
                color("coral") translate([-0.4, -0.25, 0.1]) cube([0.8, 0.5, 0.35]);
                color("ivory") translate([-0.4, -0.25, 0]) cube([0.8, 0.5, 0.1]);
                color("lightgray") for (i = [-0.3, 0.3]) {
                    translate([i - 0.2, -0.25, 0]) cube([0.4, 0.5, 0.15]);
                }
            }
            translate([26.924, (90 - 88.392)]) rotate([0,0,90]) union() {
                color("steelblue") translate([-0.4, -0.25, 0.1]) cube([0.8, 0.5, 0.35]);
                color("ivory") translate([-0.4, -0.25, 0]) cube([0.8, 0.5, 0.1]);
                color("lightgray") for (i = [-0.3, 0.3]) {
                    translate([i - 0.2, -0.25, 0]) cube([0.4, 0.5, 0.15]);
                }
            }
            //XTAL
            translate([11.684, (90 - 25.654), 0]) rotate([0,0,90]) color("dimgrey") translate([-1.6, -0.75, 0]) cube([3.2, 1.5, 0.8]);
            //0805 R
            for (i = [ [30.48, (90 - 13.462), 0], [30.48, (90 - 15.748), 0], [23.876, (90 - 66.548), 0], [27.686, (90 - 68.834), 0], [23.876, (90 - 61.976), 0], [23.876, (90 - 68.834), 0], [13.462, (90 - 2.286), 0], [7.366, (90 - 2.286), 0] ]) {
                translate(i) union() {
                    color("slategray") translate([-0.775, -0.625, 0]) cube([1.55, 1.25, 0.5]);
                    color("lightgray") for (i = [-0.825, 0.825]) {
                        translate([i - 0.175, -0.65, 0]) cube([0.35, 1.3, 0.55]);
                    }
                }
            }
            for (i = [ [28.448, (90 - 82.804), 0], [19.304, (90 - 47.752), 0], [26.162, (90 - 82.804), 0], [9.144, (90 - 85.344), 0], [35.814, (90 - 82.804), 0], [11.684, (90 - 83.82), 0], [35.814, (90 - 78.994), 0], [12.7, (90 - 7.62), 0], [4.7572, (90 - 7.62), 0] ]) {
                translate(i) rotate([0,0,90]) union() {
                    color("slategray") translate([-0.775, -0.625, 0]) cube([1.55, 1.25, 0.5]);
                    color("lightgray") for (i = [-0.825, 0.825]) {
                        translate([i - 0.175, -0.65, 0]) cube([0.35, 1.3, 0.55]);
                    }
                }
            }
            //0805 C
            for (i = [ [18.796, (90 - 18.542), 0], [18.542, (90 - 35.56), 0], [18.796, (90 - 20.828), 0], [8.382, (90 - 24.384), 0], [8.382, (90 - 26.924), 0], [10.668, (90 - 40.894), 0], [23.876, (90 - 54.864), 0], [20.066, (90 - 54.864), 0], [20.066, (90 - 57.404)], [23.876, (90 - 57.404)], [27.686, (90 - 54.864), 0], [27.686, (90 - 47.244), 0], [19.558, (90 - 64.262), 0], [23.876, (90 - 64.262), 0] ]) {
                translate(i) union() {
                    color("tan") translate([-0.8, -0.625, 0]) cube([1.6, 1.25, 1]);
                    color("lightgray") for (i = [-0.775, 0.775]) {
                        translate([i  -0.125, -0.65, 0]) cube([0.25, 1.3, 1.05]);
                    }
                }
            }
            for (i = [ [11.684, (90 - 29.718), 0], [26.162, (90 - 25.4), 0], [15.748, (90 - 19.558), 0], [29.464, (90 - 6.096), 0], [31.75, (90 - 6.096), 0], [19.304, (90 - 51.562), 0], [30.374, (90 - 72.136), 0], [16.51, (90 - 66.802)], [14.224, (90 - 66.802)], [4.572, (90 - 65.786), 0], [11.684, (90 - 87.63), 0], [10.414, (90 - 3.81), 0] ]) {
                translate(i) rotate([0,0,90]) union() {
                    color("tan") translate([-0.8, -0.625, 0]) cube([1.6, 1.25, 1]);
                    color("lightgray") for (i = [-0.775, 0.775]) {
                        translate([i  -0.125, -0.65, 0]) cube([0.25, 1.3, 1.05]);
                    }
                }
            }
            //7343 C TANT
            translate([28.702, (90 - 76.962), 0]) union() {
                color("orange") translate([-3.65, -2.15, 0]) cube([7.3, 4.3, 2.8]);
                color("darkorange") translate([-3.5, -2.2, 0]) cube([0.5, 4.4, 2.85]);
                color("lightgray") for (i = [-3.1, 3.1]) {
                    translate([i  -0.65, -1.75, 0]) cube([1.3, 3.5, 0.9]);
                }
            }
            //0805 L
            for (i = [ [27.686, (90 - 52.324), 0], [27.686, (90 - 49.784), 0] ]) {
                translate(i) union() {
                    color("darkgray") translate([-0.775, -0.625, 0]) cube([1.55, 1.25, 0.5]);
                    color("lightgray") for (i = [-0.825, 0.825]) {
                        translate([i - 0.175, -0.65, 0]) cube([0.35, 1.3, 0.55]);
                    }
                }
            }
            //4020 L
            translate([19.05, (90 - 71.628), 0]) union() {
                color("darkgray") translate([-2, -2, 0]) cube([4, 4, 2]);
            }
            //1206 F
            translate([22.606, (90 - 74.676), 0]) rotate([0,0,90]) union() {
                color("darkgreen") translate([-1.5, -0.8, 0]) cube([3, 1.6, 0.8]);
                color("lightgray") for (i = [-1.7, 1.7]) {
                    translate([i - 0.25, -0.825, 0]) cube([0.5, 1.65, 0.85]);
                }
            }
        }
        //bottom side components
        union() {
            //battery holder
            translate([19, 50, 0]) rotate([0,180,90]) union() {
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
            translate([19,50,-12.1]) union() {
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