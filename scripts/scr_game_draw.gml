draw_sprite(spr_buttons,2,64,256);

if(side & 1){
    if(subimg == 0){
        draw_sprite(spr_buttons,2,64,0);
        draw_sprite(spr_buttons,turn % 2,128*(turn & 1),256*(~turn & 1));
        draw_sprite(spr_timer,3-time1 + 4*(timer1 & 1),128,256);
        draw_sprite_ext(spr_timer,3-time2 + 4*(timer2 & 1),32,32,1,1,180,-1,1);
    } else{
        draw_sprite(spr_buttons,5,64,256);
        draw_sprite(spr_buttons,6,64,0);
    }
} else{
    if(subimg == 0){
        draw_sprite(spr_buttons,0,128*(turn & 1),256);
        draw_sprite(spr_timer,3-time1 + 4*(timer1 & 1),32,0);
        draw_sprite(spr_timer,3-time2 + 4*(timer2 & 1),96,0);
    } else{
        draw_sprite(spr_buttons,5,64,256);
    }
}

if(subimg1 > 10){
    colour1 = -1;
}
if(subimg2 > 10){
    colour2 = -1;
} 

for(c = 0;c < ds_grid_width(grid);c++){
    for(r = 0;r < ds_grid_height(grid);r++){
        if(~blind & 1){  
            switch(grid[# c,r]){
                case 0: draw_sprite_ext(spr_symbols,subimg1,c*32,r*32+64,0.2,0.2,0,colour1,1); break;
                case 1: draw_sprite_ext(spr_symbols,subimg2,c*32,r*32+64,0.2,0.2,0,colour2,1); break;
            }
        } else{
            for(i = 0; i < turnPlaced; i++){
                if(cShow[i] + rShow[i] != 20){
                    switch(grid[# cShow[i],rShow[i]]){
                        case 0: draw_sprite_ext(spr_symbols,subimg1,cShow[i]*32,rShow[i]*32+64,0.2,0.2,0,colour1,1); break;
                        case 1: draw_sprite_ext(spr_symbols,subimg2,cShow[i]*32,rShow[i]*32+64,0.2,0.2,0,colour2,1); break;
                    }
                }
            }
        }
        if(gridCheck[# c,r] == 1){
            draw_sprite(sprite_index,subimg,c*32,r*32+64);
        }
    }
}
