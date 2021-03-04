#!/bin/bash
function flattheme {
    # killall polybar
    cp ~/code/bash/gruv/rofi.txt ~/rofi-collection/gruvbox/gruvbox.rasi
    feh --bg-scale ~/Pictures/gray.png
    bspc config focused_border_color "#EBDBB2"
    bspc config normal_border_color "#928374"
    cp ~/code/bash/gruv/kitty.txt ~/.config/kitty/kitty.conf
    cp ~/code/bash/gruv/dunst.txt ~/.config/dunst/dunstrc
    cp ~/code/bash/gruv/gtk.txt > ~/.config/gtk-3.0/settings.ini
    }
function redtheme {
cp ~/code/bash/arc/kitty.txt ~/.config/kitty/kitty.conf
cp ~/code/bash/arc/gtk.txt ~/.config/gtk-3.0/settings.ini
cp ~/code/bash/arc/rofi.txt ~/rofi-collection/gruvbox/gruvbox.rasi
cp ~/code/bash/arc/dunst.txt ~/.config/dunst/dunstrc
feh --bg-scale ~/Pictures/pray.png
sed -i "24d;23d;22d;21d;20d;19s/.*/weather = #FB4934\nuptime = #FB6C34\ndate = #FABD2F\nfilesystem = #8EC07C\ncpu = #D367aB\nmemory = #83A5A8/" ~/.config/polybar/config
    bspc config focused_border_color "#DDDDDD"
    bspc config normal_border_color "#666666"
    killall dunst
    exec dunst
}
function greentheme {
    feh --bg-center ~/green.png
    bspc config focused_border_color "#055005"
    bspc config normal_border_color "#055005"
        printf "font_size  	 13
dynamic_background_opacity yes
background_opacity 0.7
background #001104
foreground #dddddd
remember_window_size  no
initial_window_width  1100
initial_window_height 700
window_padding_width 3
color7  #dddddd
color15 #ffffff" > ~/.config/kitty/kitty.conf
setsid picom
}
function startup {
xsetroot -cursor_name left_ptr
}
function solid {
    # sed -i "24d;23d;22d;21d;20d;19s/.*/weather = #FFE\nuptime = #FFE\ndate = #FFE\nfilesystem = #FFE\ncpu = #FFE\nmemory = #FFE/" ~/.config/polybar/config
    bspc config border_width 0
    cp ~/code/bash/solid/kitty.txt ~/.config/kitty/kitty.conf
}