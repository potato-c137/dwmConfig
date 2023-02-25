#not needed 
#!/bin/bash
#for the showing color icons in dwmblocks
yay -S xorg-util-macros

git clone https://github.com/uditkarode/libxft-bgra && cd libxft-bgra && sh autogen.sh --sysconfdir=/etc --prefix=/usr --mandir=/usr/share/man && sudo make install
