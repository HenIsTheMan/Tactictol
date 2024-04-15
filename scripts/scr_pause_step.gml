if(keyboard_check_pressed(ord("B"))){
    blind++;
}

if(keyboard_check_pressed(vk_shift)){
    if(~side & 1 || (side & 1 && point_in_rectangle(device_mouse_x(0),device_mouse_y(0),128*sidePressed,256*!sidePressed,128*sidePressed+32,256*!sidePressed+32))){
        audio_play_sound(snd_restart,0,0);
        scr_restart();
    }
}

if(keyboard_check_pressed(ord("C"))){
    if(subimg1 < sprite_get_number(spr_symbols) - 1){
        subimg1++;
    } else{
        subimg1 = 0;
    }
    colour1 = choose(c_red, c_orange, c_yellow, c_lime, c_blue, c_fuchsia);
}
if(keyboard_check_pressed(ord("V"))){
    if(subimg2 < sprite_get_number(spr_symbols) - 1){
        subimg2++;
    } else{
        subimg2 = 0;
    }
    colour2 = choose(c_red, c_orange, c_yellow, c_lime, c_blue, c_fuchsia);
}

if(keyboard_check_pressed(ord("N"))){
    side++;
    scr_vKeysDelete();
    scr_vKeysAdd();
    pause = 0; 
    tile_layer_show(layerDepth);
}
