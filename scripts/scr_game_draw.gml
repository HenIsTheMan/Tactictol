if(side & 1){
    if(subimg == 0){
        draw_sprite(spr_buttons,2,64,0);
        draw_sprite(spr_buttons,2,64,256);
        draw_sprite(spr_buttons,turn % 2,128*(turn & 1),256*(~turn & 1));
        draw_sprite(spr_timer,3-time1 + 4*(timer1 & 1),128,256);
        draw_sprite_ext(spr_timer,3-time2 + 4*(timer2 & 1),32,32,1,1,180,-1,1);
    } else{
        draw_sprite(spr_buttons,5,64,256);
        draw_sprite(spr_buttons,6,64,0);
    }
} else{
    if(subimg == 0){
        draw_sprite(spr_buttons,2,64,256);
        draw_sprite(spr_buttons,0,128*(turn & 1),256);
        draw_sprite(spr_timer,3-time1 + 4*(timer1 & 1),0,0);
        draw_sprite(spr_timer,3-time2 + 4*(timer2 & 1),128,0);
    } else{
        draw_sprite(spr_buttons,5,64,256);
    }
}

for(c = 0;c < ds_grid_width(grid);c++){
    for(r = 0;r < ds_grid_height(grid);r++){
        switch(grid[# c,r]){
            case 0: draw_sprite(spr_symbols,subimg1,c*32,r*32+64); break;
            case 1: draw_sprite(spr_symbols,subimg2,c*32,r*32+64); break;
        }
        if(gridCheck[# c,r] == 1){
            draw_sprite(sprite_index,subimg,c*32,r*32+64);
        }
    }
}
