if(keyboard_check_pressed(vk_space)){
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
