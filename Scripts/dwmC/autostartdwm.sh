#!/bin/bash

#=====================START====================================================

    #kill them incase of a restart
    processes_=(picom dunst mpd xfce-polkit feh dwmbar.sh)
    for pros_ in "${processes_[@]}";do
        if [[ `pidof ${pros_}` ]];then
            killall -9 ${pros_} >/dev/null 2>&1
       fi 
   done

    
    #for feh ( wallpaper )
     ~/.fehbg &  > "~/.config/dwm/logs/$(date)_fehbg.log"

    
    #dunstrc
    dunst -config "/home/potatojs/dwm/dunstrc" > "~/.config/dwm/logs/$(date)_dunstrc.log"
  

    #for picom
    picom --experimental-backends & > "~/.config/dwm/logs/$(date)_picom.log"

    #for mpd
    mpd & >/dev/null 2>&1

    #dwmbar
    dwmbar.sh &

    #for polykit
    if [[ ! `pidof xfce-polkit` ]];then
        /usr/lib/xfce-polkit/xfce-polkit & 
    fi

    
#=============================EXIT===================================================
