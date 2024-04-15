if((keyboard_check(ord("B")) && keyboard_check_pressed(ord("O"))) || (keyboard_check(ord("O")) && keyboard_check_pressed(ord("B")))){
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
}
if(keyboard_check_pressed(ord("V"))){
    if(subimg2 < sprite_get_number(spr_symbols) - 1){
        subimg2++;
    } else{
        subimg2 = 0;
    }
}

if(keyboard_check_pressed(ord("N"))){
    side++;
    if(side & 1){
        for(i = 0; i < 9; i++){
            virtual_key_delete(key[i]);
        }
        key[0] = virtual_key_add(64,0,32,32,ord("P"));
        key[1] = virtual_key_add(0,256,32,32,vk_shift); 
        key[2] = virtual_key_add(128,0,32,32,vk_shift);
        key[3] = virtual_key_add(0,256,32,32,vk_space); 
        key[4] = virtual_key_add(128,0,32,32,vk_space);
        key[5] = virtual_key_add(128,256,32,32,ord("C")); 
        key[6] = virtual_key_add(0,0,32,32,ord("V"));
        key[7] = virtual_key_add(128,256,32,32,ord("T"));
        key[8] = virtual_key_add(0,0,32,32,ord("Y"));
        key[9] = virtual_key_add(0,256,32,32,ord("B"));
        key[10] = virtual_key_add(128,0,32,32,ord("O"));
    } else{
        for(i = 0; i < 11; i++){
            virtual_key_delete(key[i]);
        }
        key[0] = virtual_key_add(64,0,32,32,vk_shift);
        key[1] = virtual_key_add(0,256,32,32,vk_space);
        key[2] = virtual_key_add(128,256,32,32,vk_space);
        key[3] = virtual_key_add(0,256,32,32,ord("C")); 
        key[4] = virtual_key_add(128,256,32,32,ord("V"));
        key[5] = virtual_key_add(0,0,32,32,ord("T"));
        key[6] = virtual_key_add(128,0,32,32,ord("Y"));
        key[7] = virtual_key_add(0,128,32,32,ord("B"));
        key[8] = virtual_key_add(128,128,32,32,ord("O"));
    }
    pause = 0; 
    tile_layer_show(layerDepth);
}
