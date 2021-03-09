lastLayerDepth = layerDepth;
tile_layer_hide(lastLayerDepth);
while(layerDepth == lastLayerDepth){
    layerDepth = irandom_range(1000000,1000006);
}
if(sameColour & 1){
    colour1 = colour[layerDepth - 1000000];
    colour2 = colour1;
    while(subimg1 > 10){
        subimg1 = irandom_range(2*(side & 1),sprite_get_number(spr_symbols) - 1);
    }
    while(subimg2 > 10 || (~sameSymbol & 1 && subimg2 == subimg1)){
        subimg2 = irandom_range(2*(side & 1),sprite_get_number(spr_symbols) - 1);
    }
} else{
    do{
        index1 = irandom_range(1000000,1000006);
    } until(index1 != layerDepth);
    do{
        index2 = irandom_range(1000000,1000006);
    } until(index2 != layerDepth && index2 != index1);
    colour1 = colour[index1 - 1000000];
    colour2 = colour[index2 - 1000000];
}
