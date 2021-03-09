if(keyboard_check_pressed(ord("N"))){
    sameSymbol = 0;
    sameColour = 0;
    blind = 0;
    scr_symbols();
    scr_colours();
}

if(keyboard_check_pressed(ord("X"))){
    sameSymbol++;
    scr_symbols();     
}

if(keyboard_check_pressed(ord("C"))){
    sameColour++;
    scr_colours();
}

if(keyboard_check_pressed(ord("B"))){
    blind++;
    blind -= 3 * (blind == 3);
}

if(keyboard_check_pressed(vk_shift)){
    if(~side & 1 || (side & 1 && point_in_rectangle(device_mouse_x(0),device_mouse_y(0),128*sidePressed,256*!sidePressed,128*sidePressed+32,256*!sidePressed+32))){
        audio_play_sound(snd_restart,0,0);
        scr_restart();
    }
}

if(keyboard_check_pressed(ord("S"))){
    side++;
    if(side & 1){
        while(subimg1 < 2){
            subimg1 = irandom_range(2,sprite_get_number(spr_symbols) - 1);
        }
        while(subimg2 < 2 || subimg2 == subimg1){
            subimg2 = irandom_range(2,sprite_get_number(spr_symbols) - 1);
        }
    }
    scr_vKeysDelete();
    scr_vKeysAdd();
    pause = 0; 
    tile_layer_show(layerDepth);
}
