lastSubimg1 = subimg1;
lastSubimg2 = subimg2;
while(subimg1 == lastSubimg1 || (sameColour & 1 && subimg1 > 10)){
    subimg1 = irandom_range(2*(side & 1),sprite_get_number(spr_symbols) - 1);
}
if(sameSymbol & 1){
    subimg2 = subimg1;
} else{
    while(subimg2 == subimg1 || subimg2 == lastSubimg2 || (sameColour & 1 && subimg2 > 10)){
        subimg2 = irandom_range(2*(side & 1),sprite_get_number(spr_symbols) - 1);
    }
}
