if(side & 1){
    for(i = 0; i < 8; i++){
        virtual_key_delete(key[i]);
    }
} else{
    for(i = 0; i < 11; i++){
        virtual_key_delete(key[i]);
    }
}
