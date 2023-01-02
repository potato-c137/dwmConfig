#!/bin/bash

#=====================START====================================================

    #kill them incase of a restart
    processes_=(picom dunst mpd xfce-polkit feh)
    for pros_ in "${processes_[@]}";do
        if [[ `pidof ${pros_}` ]];then
            killall -9 ${pros_} >/dev/null 2>&1
       fi
   done



    #for feh ( wallpaper )
     ~/.fehbg &  > "~/dwm/logs/$(date)_fehbg.log"


    #dunstrc
    dunst -config "/home/potatojs/dwm/dunstrc" > "~/dwm/logs/$(date)_dunstrc.log"


    #for picom
    picom --experimental-backends & > "~/dwm/logs/$(date)_picom.log"

    #for mpd
    mpd & 2>/dev/null


    #for polykit
    if [[ ! `pidof xfce-polkit` ]];then
        /usr/lib/xfce-polkit/xfce-polkit &
    fi

    #for handling sleep and stuff
    xfce4-power-manager &

   #dwmbar
    killall -9 dwmbar.sh >/dev/null 2>&1
    dwmbar.sh &

#=============================EXIT===================================================
