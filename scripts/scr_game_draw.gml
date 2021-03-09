if(subimg > 0){
    draw_sprite(spr_buttons,5,64,256);
    if(side & 1){
        draw_sprite(spr_buttons,6,64,0);
    }
} else{
    draw_sprite(spr_buttons,2,64,256);
    if(side & 1){
        draw_sprite(spr_buttons,turn % 2,128 * (turn & 1),256 * (~turn & 1));
        draw_sprite_ext(spr_buttons,~turn & 1,128 * (~turn & 1),256 * (turn & 1),1,1,0,-1,0.3);
        draw_sprite(spr_buttons,2,64,0);
        if(blind < 2){
            draw_sprite(spr_timer,5 - time1,64,224);
            draw_sprite_ext(spr_timer,5 - time2,96,64,1,1,180,-1,1);
        }
        draw_sprite_ext(spr_buttons,17 + (turn & 1),128 * (~turn & 1),256 * (~turn & 1),1,1,0,-1,1 - 0.7 * (!sign(placed) || blind & 1 || time1 = 0 || time2 = 0));
        draw_sprite_ext(spr_buttons,17 + (~turn & 1),128 * (turn & 1),256 * (turn & 1),1,1,0,-1,0.3);
        if(alarm[0] == -1){
            draw_sprite_ext(spr_buttons,25,32,256,1,1,0,-1,1 - 0.7 * !abs(sign(timeLimit1 - 5)));
            draw_sprite_ext(spr_buttons,26,96,256,1,1,0,-1,1 - 0.7 * !sign(timeLimit1 - 1));
            draw_sprite_ext(spr_buttons,25,96,0,1,1,0,-1,1 - 0.7 * !abs(sign(timeLimit2 - 5)));
            draw_sprite_ext(spr_buttons,26,32,0,1,1,0,-1,1 - 0.7 * !sign(timeLimit2 - 1));
        }
    } else{
        draw_sprite(spr_buttons,0,128 * (turn & 1),256);
        draw_sprite_ext(spr_buttons,0,128 * (~turn & 1),256,1,1,0,-1,0.3);
        if(blind < 2){
            draw_sprite(spr_timer,5 - time1,16,16);
            draw_sprite(spr_timer,5 - time2,112,16);
        }
        draw_sprite_ext(spr_buttons,17,32 + 64 * (turn & 1),256,1,1,0,-1,1 - 0.7 * (!sign(placed) || blind & 1 || time1 = 0 || time2 = 0));
        draw_sprite_ext(spr_buttons,17,32 + 64 * (~turn & 1),256,1,1,0,-1,0.3);
        if(alarm[0] == -1){
            draw_sprite_ext(spr_buttons,25,0,224,1,1,0,-1,1 - 0.7 * !abs(sign(timeLimit1 - 5)));
            draw_sprite_ext(spr_buttons,26,32,224,1,1,0,-1,1 - 0.7 * !sign(timeLimit1 - 1));
            draw_sprite_ext(spr_buttons,25,128,224,1,1,0,-1,1 - 0.7 * !abs(sign(timeLimit2 - 5)));
            draw_sprite_ext(spr_buttons,26,96,224,1,1,0,-1,1 - 0.7 * !sign(timeLimit2 - 1));
        }
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
        if(blind == 0 || subimg > 0){  
            switch(grid[# c,r]){
                case 0: draw_sprite_ext(spr_symbols,subimg1,c*32,r*32+64,0.2,0.2,0,colour1,1); break;
                case 1: draw_sprite_ext(spr_symbols,subimg2,c*32,r*32+64,0.2,0.2,0,colour2,1); break;
            }
        } else{
            for(i = 0; i < turnPlaced; i++){
                switch(grid[# cShow[i],rShow[i]]){
                    case 0: draw_sprite_ext(spr_symbols,subimg1,cShow[i]*32,rShow[i]*32+64,0.2,0.2,0,colour1,1); break;
                    case 1: draw_sprite_ext(spr_symbols,subimg2,cShow[i]*32,rShow[i]*32+64,0.2,0.2,0,colour2,1); break;
                }
            }
        }
        if((blind < 2 || subimg > 0) && gridCheck[# c,r] == 1 && subimg < image_number){
            draw_sprite(sprite_index,subimg,c*32,r*32+64);
        }
    }
}
