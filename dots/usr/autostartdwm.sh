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
    ~/.fehbg & disown

    #dunstrc
    dunst -config "$HOME/.dwm/dunstrc" &


    #for picom
    # use /dev/null to avoid loading config file
    picom --experimental-backends --blur-background-exclude "class_g='Polybar'" &
   
   #for mpd
    mpd & 2>/dev/null

    #for polykit
    if [[ ! `pidof xfce-polkit` ]];then
        /usr/lib/xfce-polkit/xfce-polkit &
    fi

    #for handling sleep and stuff
    xfce4-power-manager &


    #call a terminal
    [ -f /bin/tty-clock ] && st -e tty-clock -c & disown

   # using polybar now 
   # dwmbar
   # killall -9 dwmbar.sh
   # dwmbar.sh &

#=============================EXIT===================================================
