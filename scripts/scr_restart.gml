ds_grid_clear(grid,-5);
ds_grid_clear(gridCheck,0);
turn = choose(0,1);
time1 = timeLimit1;
time2 = timeLimit2;
alarm[0] = -1;
placed = 0;
turnPlaced = 0;
subimg = 0;
scr_symbols();
scr_colours();
for(i = 0; i < 25; i++){
    cShow[i] = 10;
    rShow[i] = 10;
}
pause = 0;
tile_layer_show(layerDepth);
