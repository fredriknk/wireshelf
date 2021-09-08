rod = 15;
rod2 = 15;
thickness = 20;
hooks = 3;
spacing =30;
tot_spacing = (thickness*1+rod2*2)+spacing;
tot_size = rod+thickness;
i = 1;
for ( i = [0 : hooks] ){
    translate([i*(tot_spacing)+tot_size,rod2,0]){
        translate([rod2-rod,0,0]){
            difference(){
                translate([-rod2*2-thickness,-rod2,0])
                square([2*rod2+thickness,rod2]);
                circle(rod2);
                translate([-2*rod2-thickness,0,0])
                circle(rod2);
                
            };
        };

        intersection(){
                    difference(){
                        circle(tot_size);
                        circle(rod);
                        };
                    translate([-tot_size,0,0])
                    square(tot_size);
                    };

        translate([0,rod+thickness/2,0])
        circle(thickness/2);
        };
   };
/*union(){
    //translate([rod+thickness/2,0,0]){
        intersection(){
            difference(){
                circle(tot_size);
                circle(rod);
                };
            translate([-tot_size,0,0])
            square(tot_size);
            };

        translate([0,rod+thickness/2,0])
        circle(thickness/2);

        difference(){
            translate([-tot_size*2+thickness/2,-tot_size,0])
            square([tot_size+thickness*2,tot_size]);
            translate([thickness,0,0])
            circle(tot_size);
            //translate
            //translate([rod+thickness/2,0,0])
            //circle(rod);//rod);};
            //translate([rod+thickness/2,0,0])
            //square([rod,tot_size]);}
               
            //circle(rod);//girth);
        };
    //};
};
*/