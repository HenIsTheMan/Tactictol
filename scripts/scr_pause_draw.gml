draw_sprite(spr_buttons,9 + (side & 1),64,128);
draw_sprite(spr_buttons, 7 + (blind & 1), 128, 128);

if(subimg1 > 10){
    colour1 = -1;
}
if(subimg2 > 10){
    colour2 = -1;
} 

if(side & 1){
    draw_sprite_ext(spr_symbols,subimg1,128,256,0.2,0.2,0,colour1,1);
    draw_sprite_ext(spr_symbols,subimg2,0,0,0.2,0.2,0,colour2,1);
    draw_sprite(spr_buttons,3,64,256);
    draw_sprite(spr_buttons,4,64,0);
    draw_sprite(spr_buttons, 5 + sidePressed, 128 * sidePressed, 256 * !sidePressed);
} else{
    draw_sprite_ext(spr_symbols,subimg1,0,256,0.2,0.2,0,colour1,1);
    draw_sprite_ext(spr_symbols,subimg2,128,256,0.2,0.2,0,colour2,1);
    draw_sprite(spr_buttons,3,64,256);
    draw_sprite(spr_buttons,5,64,0);
}
