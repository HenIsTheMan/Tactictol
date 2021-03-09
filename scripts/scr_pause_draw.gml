draw_sprite(spr_buttons,(side & 1) + 7,64,128);
if(side & 1){
    draw_sprite(spr_symbols,subimg1,64,256);
    draw_sprite(spr_symbols,subimg2,64,0);
    draw_sprite(spr_buttons,3,128,256);
    draw_sprite(spr_buttons,4,0,0);
    draw_sprite(spr_buttons,5,64,192);
    draw_sprite(spr_buttons,6,64,64);
    draw_sprite(spr_timer,4*(timer1 & 1),0,256);
    draw_sprite_ext(spr_timer,3-time2 + 4*(timer2 & 1),160,32,1,1,180,-1,1);
} else{
    draw_sprite(spr_symbols,subimg1,0,256);
    draw_sprite(spr_symbols,subimg2,128,256);
    draw_sprite(spr_buttons,3,64,256);
    draw_sprite(spr_buttons,5,64,0);
    draw_sprite(spr_timer,4*(timer1 & 1),0,0);
    draw_sprite(spr_timer,4*(timer2 & 1),128,0);
}
