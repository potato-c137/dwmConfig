## Dwm config

this is an installer ( tested and working with only archlinux )

Install:

```bash
 git clone https://github.com/potato-c137/dwmConfig
 cd dwmConfig
 sudo chmod +x ./install.sh
 ./install.sh

```

---

## Screenshots

![shot1](./screenshots/shot1.png)

![shot2](./screenshots/shot2.png)

---

## Keybinds

```

W = Windows Key / super
C = Crtl
S = Shift
A = Alt
RET = Enterkey

important::
W + RET = terminal
W + c = close / kill
W + b = show status bar
W + d = rofi app menu
W + S + n = rofi network menu
W + j / k = move bettween Windows
W + right / left = move bettween Windows
W + h / l = increase size of master ( main window )
W + C + right / left = increase size of master ( main window )
W + o = increase number or master Windows
W + S + o = decrease size of master windows
W + C + q = kill dwm ( restart dwm )
W + 1-9 = move bettween 1-9 workspaces


others::
W + S + RET = floating terminal
W + ; = move left in workspaces
W + " = move right in workspaces
W + \ = switch bettween previous active workspace and back
W + tab = show all windows in 0 workspace
W + 0 = show all windows in 0 workspace
W + a = toggle gaps on / off
W + z = decrease gap size
W + x = increase gap size
W + s = make window sticky ( show everywhere you go )
A + u = scroll up
A + up = scroll up
A + down = scroll down
A + S + up = zoom in terminal
A + S + down = zoom out terminal

window types
W + t = default
W + S + t = tree
W + y = spiral
W + S + y = spiral but reversed
W + u = card deck* ( name made up, i forgot the name )
W + S + u = card deack float*
W + i = center master
W + S + i = floating center master

music::
W + '+' = Increment Volume
W + '-' = Decrement Volume
W + p = play/pause
W + '{' / '}' = seek foward / back (music)


apps::
W + r = ranger
W + w = firefox
W + q = whatspp-for-linux
W + a = telegram
W + z = discord
W + m = ncmpcpp (music)
W + n = neovim
```

---

| system        | apps                 |
| ------------- | -------------------- |
| **terminal**  | st                   |
| **launcher**  | rofi                 |
| **bar**       | dwmbar( the og bar ) |
| **wallpaper** | feh                  |

> NB:: if you dont use sddm please try to call the autostart script in /Scipts/dwmC in your login manager

### More Info

<details><summary>Dwm build</summary><p>

the dwm build is from my [dwm repo](https://github.com/potato-c137/dwm)

## </p>

<details><summary>st build</summary><p>

the st build in from my [st repo](https:///github.com/potato-c137/st)

</p>

---

<details><summary>The bar</summary><p>

i use the dwmbar ( the one dwm came with )

it is in `dwmConfig/Scripts/usr/` , make sure to move everything in Scripts/usr folder to `/usr/bin/` execpt the installers

the autostart script calls it so it needs to be in path

</p>

---

<details><summary>Autostart script</summary><p>

the autostart script is in `/Scripts/dwmC/autostartdwm.sh`

**i use sddm so i call it in ~/.xprofile**

it starts : picom, dunstrc, dwmbar , polykit(xfce4) , feh , and a term instance to call tty-clock

move the folder ./Scripts/dwmC/ to ~/dwm

In the xprofile it will call ~/dwm/autostartdwm.sh and the dunstrc config file too

</p>

---

<details><summary>Rofi</summary><p>

the rofi runners are in ./Scripts/usr/rofi_menu_run and rofi_network_run

the rofi_menu_run one calls menu and the rofi_network_run calls the network one,

the call other config files in ./Scripts/dwmC/rofi/ which was to be placed in ~/dwm/

</p>

---

**wallpaper was set with feh**

</details>
