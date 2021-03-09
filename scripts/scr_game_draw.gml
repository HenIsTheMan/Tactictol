draw_sprite(spr_buttons,2,0,0);
draw_sprite(spr_buttons,2,128,256);
draw_sprite(spr_buttons,turn % 2,128*(turn & 1),256*(~turn & 1));
draw_sprite_ext(spr_countdown,3-time2,96,32,1,1,180,-1,1);
draw_sprite(spr_countdown,3-time1,64,256);

for(c = 0;c < ds_grid_width(grid);c++){
    for(r = 0;r < ds_grid_height(grid);r++){
        if(grid[# c,r] != -5){
            draw_sprite(spr_symbols,grid[# c,r],c*32,r*32+64);
        }
        if(gridCheck[# c,r] == 1){
            draw_sprite(sprite_index,subimg,c*32,r*32+64);
        }
    }
}
