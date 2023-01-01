### Dwm config

#### added an installer script

tested on **archlinux** working

tested on **debain** so many dependices errors in building dwm and st and picom , if you can find the dependices it should work as expected

| system        | apps                 |
| ------------- | -------------------- |
| **terminal**  | st                   |
| **launcher**  | rofi                 |
| **bar**       | dwmbar( the og bar ) |
| **wallpaper** | feh                  |

###### NB:: if you dont use sddm please try to autostart script in /Scipts/dwmC in your login manager

### More Info

#### Dwm build

the dwm build is in dwm folder, go in and build
there have been different themes through out and i have stated then in the commits,
so checkout any
colors config are in colors.h

---

#### st build

the st build in the st folder, go in and make
there have been different themes too so checkout whichever
colors config in colors.h

---

#### dwmbar

i use the dwmbar ( the one dwm came with )
it is in /Scripts/usr/ , make sure to move everything in Scripts/usr folder to `/usr/bin/` execpt the installers
the autostart script calls it so it needs to be in path

---

#### autostart

the autostart script is in ./Scripts/dwmC/autostartdwm.sh
i use sddm so i call it in ~/.xprofile
it starts : picom, dunstrc, dwmbar , polykit(xfce4) , feh
move the folder ./Scripts/dwmC/ to ~/dwm
cus in the xprofile it calls ~/dwm/autostartdwm.sh and the dunstrc config file too

---

#### rofi

the rofi runners are in ./Scripts/usr/rofi_menu_run and rofi_network_run
the rofi_menu_run one calls menu and the rofi_network_run calls the network one,
the call other config files in ./Scripts/dwmC/rofi/ which was to be placed in ~/dwm/

---

**wallpaper was set with feh**
