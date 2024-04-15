if(side & 1){
    key[0] = virtual_key_add(64,0,32,32,ord("P"));
    key[1] = virtual_key_add(0,256,32,32,vk_shift); 
    key[2] = virtual_key_add(128,0,32,32,vk_shift);
    key[3] = virtual_key_add(0,256,32,32,vk_space); 
    key[4] = virtual_key_add(128,0,32,32,vk_space);
    key[5] = virtual_key_add(128,256,32,32,ord("C")); 
    key[6] = virtual_key_add(0,0,32,32,ord("V"));
    key[7] = virtual_key_add(128,256,32,32,ord("T"));
    key[8] = virtual_key_add(0,0,32,32,ord("Y"));
} else{
    key[0] = virtual_key_add(64,0,32,32,vk_shift);
    key[1] = virtual_key_add(0,256,32,32,vk_space);
    key[2] = virtual_key_add(128,256,32,32,vk_space);
    key[3] = virtual_key_add(0,256,32,32,ord("C")); 
    key[4] = virtual_key_add(128,256,32,32,ord("V"));
    key[5] = virtual_key_add(32,0,32,32,ord("T"));
    key[6] = virtual_key_add(96,0,32,32,ord("Y"));
}
