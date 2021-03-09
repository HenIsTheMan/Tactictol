if(keyboard_check_pressed(vk_shift)){
    audio_play_sound(snd_restart,0,0);
    room_restart();
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
        for(i = 0; i < 7; i++){
            virtual_key_delete(key[i]);
        }
        key[0] = virtual_key_add(64,0,32,32,ord("P"));
        key[1] = virtual_key_add(64,64,32,32,vk_shift); 
        key[2] = virtual_key_add(64,192,32,32,vk_shift);
        key[3] = virtual_key_add(0,256,32,32,vk_space); 
        key[4] = virtual_key_add(128,0,32,32,vk_space);
        key[5] = virtual_key_add(128,256,32,32,ord("C")); 
        key[6] = virtual_key_add(0,0,32,32,ord("V"));
        key[7] = virtual_key_add(128,256,32,32,ord("T"));
        key[8] = virtual_key_add(0,0,32,32,ord("Y"));
    } else{
        for(i = 0; i < 9; i++){
            virtual_key_delete(key[i]);
        }
        key[0] = virtual_key_add(64,0,32,32,vk_shift);
        key[1] = virtual_key_add(0,256,32,32,vk_space);
        key[2] = virtual_key_add(128,256,32,32,vk_space);
        key[3] = virtual_key_add(0,256,32,32,ord("C")); 
        key[4] = virtual_key_add(128,256,32,32,ord("V"));
        key[5] = virtual_key_add(0,0,32,32,ord("T"));
        key[6] = virtual_key_add(128,0,32,32,ord("Y"));
    }
    pause = 0;
    tile_layer_show(layerDepth);
}
