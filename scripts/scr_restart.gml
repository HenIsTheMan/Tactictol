ds_grid_clear(grid,-5);
ds_grid_clear(gridCheck,0);
turn = choose(0,1);
time1 = timeLimit;
time2 = timeLimit;
alarm[0] = -1;
placed = 0;
turnPlaced = 0;
subimg = 0;
lastSubimg1 = subimg1;
while(subimg1 == lastSubimg1){
    subimg1 = irandom_range(2*(side & 1),sprite_get_number(spr_symbols) - 1);
}
subimg2 = subimg1;
while(subimg2 == subimg1){
    subimg2 = irandom_range(2*(side & 1),sprite_get_number(spr_symbols) - 1);
}
colour1 = choose(c_red, c_orange, c_yellow, c_lime, c_blue, c_fuchsia);
colour2 = choose(c_red, c_orange, c_yellow, c_lime, c_blue, c_fuchsia);
for(i = 0; i < 25; i++){
    cShow[i] = 10;
    rShow[i] = 10;
}
lastLayerDepth = layerDepth;
tile_layer_hide(lastLayerDepth);
while(layerDepth == lastLayerDepth){
    layerDepth = irandom_range(1000000,1000006);
}
switch(pause){
    case 0: tile_layer_show(layerDepth); break;
    case 1: pause = 0; tile_layer_show(layerDepth); break;
}
