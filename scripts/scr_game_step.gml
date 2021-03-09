x = device_mouse_x(0) div 32 * 32;
y = device_mouse_y(0) div 32 * 32;

if(time1 != 0 && time2 != 0 && device_mouse_check_button_pressed(0,mb_left) && point_in_rectangle(device_mouse_x(0),device_mouse_y(0),0,64,160,64+160)){
    if(grid[# x/32,y/32 - 2] == -5 && (placed == 0 || block)){
        block = 0;
        placed++;
        if(turn & 1){
            grid[# x/32,y/32 - 2] = 1;
        } else{
            grid[# x/32,y/32 - 2] = 0;
        }
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
        if(placed > 1 && !block){
            audio_play_sound(snd_lose,0,0);
            room_restart();
        } else{
            audio_play_sound(snd_beep,0,0);
        }
        time1 = 3;
        time2 = 3;
        alarm[0] = 1000000/delta_time;
    } else if(subimg == 0 && grid[# x/32,y/32 - 2] != -5 && gridCheck[# x/32,y/32 - 2] == 0){
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
    } else if(subimg == 0){
        gridCheck[# x/32,y/32 - 2] = 0;
    }
}

if(keyboard_check_pressed(vk_space) && point_in_rectangle(device_mouse_x(0),device_mouse_y(0),128*(turn & 1),256*(~turn & 1),128*(turn & 1)+32,256*(~turn & 1)+32)){
    block = 0;
    placed = 0;
    subimg = 0;
    ds_grid_clear(gridCheck,0);
    turn++;
    if(ds_grid_get_mean(grid,0,0,4,4) != -5){
        time1 = 3;
        time2 = 3;
        alarm[0] = 1000000/delta_time;
    }
}
