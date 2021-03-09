draw_sprite(spr_buttons,7,0,128);
draw_sprite(spr_buttons,8 + (sameSymbol & 1),32,128);
draw_sprite(spr_buttons,10 + (side & 1),64,128);
draw_sprite(spr_buttons,12 + (sameColour & 1),96,128);
draw_sprite(spr_buttons,14 + blind,128,128);

if(side & 1){
    draw_sprite(spr_buttons,3,64,256);
    draw_sprite(spr_buttons,4,64,0);
    draw_sprite(spr_buttons, 5 + sidePressed, 128 * sidePressed, 256 * !sidePressed);
} else{
    draw_sprite(spr_buttons,3,64,256);
    draw_sprite(spr_buttons,5,64,192);
}
