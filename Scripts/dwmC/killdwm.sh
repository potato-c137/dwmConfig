#!/bin/bash

#restart dwm
processes_=(picom dunst xfce-polkit feh)
    for pros_ in "${processes_[@]}";do
        if [[ `pidof ${pros_}` ]];then
            killall -9 ${pros_} >/dev/null 2>&1
       fi
   done

if [ `pidof mpd` ];then
    mpc pause; pauseallmpv
    killall -9 mpd
fi
if [ `pidof dwm` ];then
    killall -9 dwm
fi
