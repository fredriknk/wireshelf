rod = 10; //Rod size
rod2 = 20; //Rod clearance
thickness = 20; //thickness of fingers
hooks = 12; //number of hooks
spacing =11; //extra spacing between hooks
depth = 150;// depth center of rod to back wall

laser_Gap = 0.1; //laser gap

plate_thickness = 4; //plate thickness
tab_height = 40; //tab length
tab_space = 40; //tab spacing

width = 400; //witdh between fingerplates
edge = 40; //border around finger plates

b = width+edge*2;

c_tab_height = tab_height-laser_Gap;

c_tab_space = tab_space +laser_Gap;

tab_repeat = tab_space+tab_height;

tot_spacing = (thickness*1+rod2*2)+spacing;

tot_size = rod+thickness;

total_height = (hooks)*(tot_spacing)+tot_size+tot_size;

h = floor(total_height/tab_repeat)*tab_repeat+c_tab_height + edge*2;


translate([edge,b+10,0]){
    union(){
        translate([0,plate_thickness,0]){
            difference(){
                union(){
                    //Make hook parts
                    for ( i = [0 : hooks] ){
                        translate([i*(tot_spacing)+tot_size,depth,0]){
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
                        
                   
                   square([floor(total_height/tab_repeat)*tab_repeat+c_tab_height,depth-rod2]);
                   };
               //remove remaining bottom sliver
               translate([-rod2,depth-rod2,0])
               square(rod2);
            };
        };
        for ( i = [0 : floor(total_height/tab_repeat)] ){
            translate([i*tab_repeat,0,0]){
                square([c_tab_height,plate_thickness*2]);
           
            };
        };
    };
}

difference(){
    square([h,b]);
    
    translate([edge,edge,0]){
        for ( i = [0 : floor(total_height/tab_repeat)] ){
            translate([i*tab_repeat,0,0])
            square([c_tab_height,plate_thickness]);
        };
        }
    translate([edge,edge+width,0]){
        for ( i = [0 : floor(total_height/tab_repeat)] ){
            translate([i*tab_repeat,0,0])
            square([c_tab_height,plate_thickness]);
        };
        }
    
}


echo(height = str(h),width = str(b));
