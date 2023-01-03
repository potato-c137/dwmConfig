#!/bin/bash
printf  "%s\n%s" "Before you install you should know the startup script depends on sddm/light" "It is placed in ~/.xprofile, if those arent found, the start script wont be called so configure mannually"
#colors
col1='\e[31m'
col2='\e[32m'
col3='\e[33m'
res='\e[0m'
bold='\e[1m'

printf "%s\n>>" "what is your passwd :"
read -s passwd_

#functions
function installing(){
    printf "\n${bold}${col3}[*]  ${res}Configuring %s...\n" "$1"
}

function error_(){
    printf "\n${bold}${col1}[ERR]:  ${res}%s\n" "$1"
    exit 1
}

function execsudo(){
     echo "$passwd_" | sudo -S -k $1
}

echo "$passwd_" | sudo -S -k printf "${col3}[*] ${res}%s\n" "testing sudo passed..." || error_ "Incorrect password"

#main::
printf "${col3}[*]${res} %s\n" "Getting folders ready..."
git clone https://github.com/potato-c137/dwm
git clone https://github.com/potato-c137/st
git clone https://github.com/jonaburg/picom
printf "Done\n"

printf "${col3}[*]${res} %s\n" "checking folders and path..."
[ -d dwm ] && [ -d st ] && [ -d Scripts ] && dir=$(pwd) || error_ "could not find folders, are you in the dwmConfig directory?"
printf "Done\n"

printf "\n${bold}${col3}[*]${res}${bold} %s${res}\n" "Installating.. "

installing "Dwm"
[ -d "$dir/dwm" ] && cd "$dir/dwm" && execsudo "make install" || error_ "error isntalling dwm"

sleep 1

installing "st"
[ -d "$dir/st" ] && cd "$dir/st" && execsudo "make install" || error_ "error installing st terminal"

sleep 1

installing "picom"
[ -d "$dir/picom" ] && cd "$dir/picom" && if [ -f /bin/meson ];then printf "%s" "";else execsudo "pacman -Sy meson ninja libev uthash libconfig --noconfirm";fi && meson setup --buildtype=release . build && execsudo "ninja -C build install" || error_ "intalling picom failed, you are probably still missing some dependencies\n"

sleep 1

[ -d "$dir/Scripts" ] && [ -f /bin/sddm ] && [ -f "$dir/Scripts/dwm.desktop" ] && [ -d /usr/share/xsessions/ ] && installing "sddm" && execsudo "cp  $dir/Scripts/dwm.desktop /usr/share/xsessions/" && [ -f "$dir/Scripts/xprofile" ] && if [ -f ~/.xprofile ];then cp ~/.xprofile ~/.xprofile_backup;else printf "%s\n" "no ~/.xprofile found" ;fi && cp "$dir/Scripts/xprofile" ~/.xprofile || if [ ! -f /bin/sddm ];then printf "${bold}${col1}[ERR]  ${res}%s\n" "sddm not installed skipping";else error_ "Could not configure sddm" ;fi

sleep 1

installing "/usr scripts"
[ -d "$dir/Scripts/usr/" ] && execsudo "sudo chmod -R a+x $dir/Scripts/usr/" && execsudo "cp $dir/Scripts/usr/* /usr/bin/" || error_ "could not copy /usr files over"

sleep 1

installing "dwm config folder"
[ -d "$dir/Scripts/dwmC/" ] && execsudo "chmod -R a+x $dir/Scripts/dwmC/*" && cp -r $dir/Scripts/dwmC ~/dwm || error_ "could not copy config files over"

sleep 1

installing "feh"
execsudo "pacman -S feh --noconfirm" || error_ "feh wasnt able to install" 

printf "${col3}[*]  ${res}%s\n" "runing feh"
[ -d $dir/wallpaper ] && cp $dir/wallpaper/wallpaper_green_theme.jpg ~/.wallpaper.jpg && feh --bg-scale ~/.wallpaper.jpg & disown || error_ "creating .fehbg failed"

printf "${bold}${col1}[*]  ${bold}${res}%s\n" "Installation done"
