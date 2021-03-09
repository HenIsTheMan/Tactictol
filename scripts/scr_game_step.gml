x = device_mouse_x(0) div 32 * 32;
y = device_mouse_y(0) div 32 * 32;

if(time1 != 0 && time2 != 0 && device_mouse_check_button_pressed(0,mb_left) && point_in_rectangle(device_mouse_x(0),device_mouse_y(0),0,64,160,64+159)){
    if(grid[# x/32,y/32 - 2] == -5 && (placed == 0 || block)){
        if(placed == 0){
            for(i = 0; i < 25; i++){
                cShow[i] = 10;
                rShow[i] = 10;
            }
        }
        block = 0;
        grid[# x/32,y/32 - 2] = turn & 1;
        cShow[placed] = x/32;
        rShow[placed] = y/32 - 2;
        placed++;
        turnPlaced = placed;
        //collision_line(m*32,n*32+64,(m+3)*32,(n+3)*32+64,self,0,0), collision_line((m+3)*32,n*32+64,m*32,(n+3)*32+64,self,0,0)
        for(m = 0;m < 3;m++){
            for(n = 0;n < 3;n++){
                sum1 = ds_grid_get(grid,m,n) + ds_grid_get(grid,m+1,n+1) + ds_grid_get(grid,m+2,n+2); 
                sum2 = ds_grid_get(grid,m+2,n) + ds_grid_get(grid,m+1,n+1) + ds_grid_get(grid,m,n+2);
                if((sum1 == (~turn & 1) + 1 && (point_in_rectangle(device_mouse_x(0),device_mouse_y(0),m*32,n*32+64,m*32+32,n*32+64+32) || point_in_rectangle(device_mouse_x(0),device_mouse_y(0),(m+1)*32,(n+1)*32+64,(m+1)*32+32,(n+1)*32+64+32) || point_in_rectangle(device_mouse_x(0),device_mouse_y(0),(m+2)*32,(n+2)*32+64,(m+2)*32+32,(n+2)*32+64+32))) || (sum2 == (~turn & 1) + 1 && (point_in_rectangle(device_mouse_x(0),device_mouse_y(0),(m+2)*32,n*32+64,(m+2)*32+32,n*32+64+32) || point_in_rectangle(device_mouse_x(0),device_mouse_y(0),(m+1)*32,(n+1)*32+64,(m+1)*32+32,(n+1)*32+64+32) || point_in_rectangle(device_mouse_x(0),device_mouse_y(0),m*32,(n+2)*32+64,m*32+32,(n+2)*32+64+32)))){
                    block = 1;
                }
            }
        }
        for(m = 0;m < 5;m++){
            for(n = 0;n < 3;n++){
                if((point_in_rectangle(device_mouse_x(0),device_mouse_y(0),m*32,n*32+64,m*32+32,(n+3)*32+64) && ds_grid_get_sum(grid,m,n,m,n+2) == (~turn & 1) + 1) || (point_in_rectangle(device_mouse_x(0),device_mouse_y(0),n*32,m*32+64,(n+3)*32,m*32+64+32) && ds_grid_get_sum(grid,n,m,n+2,m) == (~turn & 1) + 1)){
                    block = 1;
                }
            }
        }
        time1 = timeLimit1;
        time2 = timeLimit2;
        alarm[0] = 1000000/delta_time;
        if(placed > 1 && !block){
            audio_play_sound(snd_lose,0,0);
            ds_grid_clear(gridCheck,0);
            gridCheck[# x/32,y/32 - 2] = 1;
            subimg = 2;
        } else{
            audio_play_sound(snd_beep,0,0);
        }
    } else if(grid[# x/32,y/32 - 2] != -5 && gridCheck[# x/32,y/32 - 2] == 0){
        if(ds_grid_get_sum(gridCheck,0,0,4,4) == 3){
            ds_grid_clear(gridCheck,0);
        }
        gridCheck[# x/32,y/32 - 2] = 1;
        for(m = 0;m < 3;m++){
            for(n = 0;n < 3;n++){
                sum1 = ds_grid_get(grid,m,n) + ds_grid_get(grid,m+1,n+1) + ds_grid_get(grid,m+2,n+2);
                sum2 = ds_grid_get(grid,m+2,n) + ds_grid_get(grid,m+1,n+1) + ds_grid_get(grid,m,n+2);  
                sum3 = ds_grid_get(gridCheck,m,n) + ds_grid_get(gridCheck,m+1,n+1) + ds_grid_get(gridCheck,m+2,n+2);
                sum4 = ds_grid_get(gridCheck,m+2,n) + ds_grid_get(gridCheck,m+1,n+1) + ds_grid_get(gridCheck,m,n+2);
                if((sum1 == 3*(turn % 2) || sum2 == 3*(turn % 2)) && (sum3 == 3 || sum4 == 3)){
                    if(placed > 1){
                        audio_play_sound(snd_blockWin,0,0);
                    } else{
                        audio_play_sound(snd_normalWin,0,0);
                    }
                    subimg = 1;
                }
            }
        }
        for(m = 0;m < 5;m++){
            for(n = 0;n < 3;n++){
                if(ds_grid_get_sum(gridCheck,m,n,m,n+2) == 3 || ds_grid_get_sum(gridCheck,n,m,n+2,m) == 3){
                    if(ds_grid_get_sum(grid,m,n,m,n+2) == 3*(turn % 2) || ds_grid_get_sum(grid,n,m,n+2,m) == 3*(turn % 2)){
                        if(placed > 1){
                            audio_play_sound(snd_blockWin,0,0);
                        } else{
                            audio_play_sound(snd_normalWin,0,0);
                        }
                        subimg = 1;
                    }
                }
            }
        }
    } else{
        gridCheck[# x/32,y/32 - 2] = 0;
    }
}

if(keyboard_check_pressed(ord("U")) && placed > 0 && time1 != 0 && time2 != 0 && ((~side & 1 && point_in_rectangle(device_mouse_x(0),device_mouse_y(0),32 + 64 * (turn & 1),256,32 + 64 * (turn & 1) + 32,288)) || (side & 1 && point_in_rectangle(device_mouse_x(0),device_mouse_y(0),128*(~turn & 1),256*(~turn & 1),128*(~turn & 1)+32,256*(~turn & 1)+32)))){
    placed--;
    turnPlaced = placed;
    grid[# cShow[placed],rShow[placed]] = -5;
    cShow[placed] = 10;
    cShow[placed] = 10;
}

if(alarm[0] == -1){
    if(keyboard_check_pressed(vk_up)){
        if(timeLimit1 < 5 && point_in_rectangle(device_mouse_x(0),device_mouse_y(0),0,0,80,288)){
            timeLimit1++;
        }
        if(timeLimit2 < 5 && point_in_rectangle(device_mouse_x(0),device_mouse_y(0),80,0,160,288)){
            timeLimit2++;
        }
    }
    if(keyboard_check_pressed(vk_down)){
        if(timeLimit1 > 1 && ((side & 1 && point_in_rectangle(device_mouse_x(0),device_mouse_y(0),96,256,128,288)) || (~side & 1 && point_in_rectangle(device_mouse_x(0),device_mouse_y(0),32,224,64,256)))){
            timeLimit1--;
        }
        if(timeLimit2 > 1 && ((side & 1 && point_in_rectangle(device_mouse_x(0),device_mouse_y(0),32,0,64,32)) || (~side & 1 && point_in_rectangle(device_mouse_x(0),device_mouse_y(0),96,224,128,256)))){
            timeLimit2--;
        }
    }
    time1 = timeLimit1;
    time2 = timeLimit2;
}

if(keyboard_check_pressed(vk_space)){
    if((side & 1 && point_in_rectangle(device_mouse_x(0),device_mouse_y(0),128*(turn & 1),256*(~turn & 1),128*(turn & 1)+32,256*(~turn & 1)+32)) || (~side & 1 && point_in_rectangle(device_mouse_x(0),device_mouse_y(0),128*(turn & 1),256,128*(turn & 1)+32,256+32))){
        audio_play_sound(snd_end,0,0);
        block = 0;
        placed = 0;
        ds_grid_clear(gridCheck,0);
        turn++;
        if(alarm[0] != -1){
            time1 = timeLimit1;
            time2 = timeLimit2;
            alarm[0] = 1000000/delta_time;
        }
    }
}

//sudden death
if(ds_grid_get_min(grid,0,0,4,4) == 0 && (time1 == 0 || time2 == 0)){
    if(timeLimit1 + timeLimit2 > 2){
        timeLimit1--;
        timeLimit2--;
        scr_restart();
    } else{
        ds_grid_clear(gridCheck,0);
        subimg = 3;
    }
}
