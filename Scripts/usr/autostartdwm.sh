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
     ~/.fehbg &  


    #dunstrc
    dunst -config "/home/potatojs/dwm/dunstrc" 


    #for picom
    picom --experimental-backends --config "$HOME/dwm/picom.conf" & 

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

    #call a terminal
    [ -f /bin/tty-clock ] && st -e tty-clock -c & disown
#=============================EXIT===================================================
