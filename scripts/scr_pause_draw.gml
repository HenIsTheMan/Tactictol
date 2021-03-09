draw_sprite(spr_buttons,(side & 1) + 7,64,128);
if(side & 1){
    draw_sprite(spr_symbols,subimg1,128,256);
    draw_sprite(spr_symbols,subimg2,0,0);
    draw_sprite(spr_buttons,3,64,256);
    draw_sprite(spr_buttons,4,64,0);
    draw_sprite(spr_buttons, 5 + sidePressed, 128 * sidePressed, 256 * !sidePressed);
} else{
    draw_sprite(spr_symbols,subimg1,0,256);
    draw_sprite(spr_symbols,subimg2,128,256);
    draw_sprite(spr_buttons,3,64,256);
    draw_sprite(spr_buttons,5,64,0);
}
