set $mod Mod4

# Configure border style <normal|1pixel|pixel xx|none|pixel>
new_window none
new_float normal

# Hide borders
hide_edge_borders none

# font
font pango: DroidSansMono Nerd Font Regular 14

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec i3-sensible-terminal

# kill focused window
bindsym $mod+q kill

# Launcher
bindsym $mod+space exec rofi -show run -font "Source Code Pro 64" -fullscreen -lines 3 -eh 1 -padding 200 -opacity "95" -bw 0

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# split in horizontal orientation
bindsym $mod+b split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

set $ws1 1:  Work
set $ws2 2:  Web
set $ws3 3:  Work
set $ws4 4:  Terminals
set $ws5 5: Ranger
set $ws6 6: Misc.
set $ws7 7:  Mail  Calendar IRC
set $ws8 8: Misc.
set $ws8 9: Misc.

# switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9

# reload the configuration file
bindsym $mod+Shift+c reload

# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym h resize shrink width 10 px or 10 ppt
        bindsym j resize grow height 10 px or 10 ppt
        bindsym k resize shrink height 10 px or 10 ppt
        bindsym l resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

# Set shut down, restart and locking features
bindsym $mod+0 mode "$mode_system"
set $mode_system (l)ock, (r)eboot, (Shift+s)hutdown
mode "$mode_system" {
     bindsym l exec --no-startup-id gnome-screensaver-command -l, mode "default"
     bindsym r exec --no-startup-id systemctl reboot, mode "default"
     bindsym Shift+s exec --no-startup-id systemctl poweroff, mode "default"

    # exit system mode: "Enter" or "Escape"
    bindsym Return mode "default"
    bindsym Escape mode "default"
}

exec --no-startup-id nm-applet
exec --no-startup-id /usr/libexec/gnome-settings-daemon
exec --no-startup-id blueman-applet

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        status_command i3status
        tray_output primary
	position top
        font pango:DroidSansMonoForPowerline Nerd Font Regular 14
  colors {
    background #343d46
    statusline #eff1f5
    separator #323232
    focused_workspace #a3be8c #65737e #eff1f5
    active_workspace #4f5b66 #5f676a #eff1f5
    inactive_workspace #4f5b66 #4f5b66 #a7adba
    urgent_workspace #bf616a #65737e #eff1f5
  }
}

# Pulse Audio controls
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5% #increase sound volume
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5% #decrease sound volume
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle # mute sound

# Sreen brightness controls
bindsym XF86MonBrightnessUp exec xbacklight -inc 20 # increase screen brightness
bindsym XF86MonBrightnessDown exec xbacklight -dec 20 # decrease screen brightness

# Background
exec --no-startup-id feh --bg-fill /usr/share/backgrounds/Famille2016.jpg
exec --no-startup-id udiskie --tray

# Setup for 1 and 3 monitors
bindsym $mod+m         exec bash ~/.screenlayout/1head.sh
bindsym $mod+shift+m   exec bash ~/.screenlayout/3head.sh
