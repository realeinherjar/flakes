{ config, lib, pkgs, ... }:

{
  imports = [ (import ../../environment/hypr-variables.nix) ];
  programs = {
    bash = {
      initExtra = ''
        if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
           exec  Hyprland
        fi
      '';
    };
    fish = {
      loginShellInit = ''
        set TTY1 (tty)
        [ "$TTY1" = "/dev/tty1" ] && exec Hyprland
      '';
    };
  };
  systemd.user.targets.hyprland-session.Unit.Wants =
    [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    enableNvidiaPatches = false;
    extraConfig = ''
      $mainMod = SUPER
      # $scripts=$HOME/.config/hypr/scripts

      monitor=,preferred,auto,1 
      # monitor=HDMI-A-1, 1920x1080, 0x0, 1
      # monitor=eDP-1, 1920x1080, 1920x0, 1
      # monitor=eDP-1, highres, 0x0, 1
      # monitor=,highres,auto,1,mirror,eDP-1

      # Source a file (multi-file configs)
      # source = ~/.config/hypr/myColors.conf

      input {
        kb_layout = us
        kb_variant = colemak
        kb_model =
        # kb_options = caps:escape # solved by keyd
        kb_rules =
        repeat_delay = 200
        repeat_rate = 30

        follow_mouse = 2 # 0|1|2|3
        float_switch_override_focus = 2
        numlock_by_default = true

        touchpad {
          disable_while_typing = true
          natural_scroll = true
          clickfinger_behavior = true
          middle_button_emulation = false
          tap-to-click = false
          drag_lock = false
        }

        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }

      general {
        gaps_in = 3
        gaps_out = 5
        border_size = 3
        col.active_border = rgb(ffc0cb)
        col.inactive_border = rgba(595959aa)

        layout = dwindle # master|dwindle 
      }

      dwindle {
        no_gaps_when_only = false
        force_split = 0 
        special_scale_factor = 0.8
        split_width_multiplier = 1.0 
        use_active_for_splits = true
        pseudotile = yes 
        preserve_split = yes 
      }

      master {
        new_is_master = true
        special_scale_factor = 0.8
        new_is_master = true
        no_gaps_when_only = false
      }

      # cursor_inactive_timeout = 0
      decoration {
        multisample_edges = true
        active_opacity = 1.0
        inactive_opacity = 1.0
        fullscreen_opacity = 1.0
        rounding = 0
        blur = yes 
        blur_size = 3
        blur_passes = 1
        blur_new_optimizations = true
        blur_xray = true

        drop_shadow = false
        shadow_range = 4
        shadow_render_power = 3
        shadow_ignore_window = true
      # col.shadow = 
      # col.shadow_inactive
      # shadow_offset
        dim_inactive = false
      # dim_strength = #0.0 ~ 1.0
        blur_ignore_opacity = false
        col.shadow = rgba(1a1a1aee)
      }

      # animations {
      #   enabled = yes
      #
      #   bezier = easeOutElastic, 0.05, 0.9, 0.1, 1.05
      #   # bezier=overshot,0.05,0.9,0.1,1.1
      #
      #   animation = windows, 1, 5, easeOutElastic
      #   animation = windowsOut, 1, 5, default, popin 80%
      #   animation = border, 1, 8, default
      #   animation = fade, 1, 5, default
      #   animation = workspaces, 1, 6, default
      # }
      animations {
        enabled=1
        bezier = overshot, 0.05, 0.9, 0.1, 1.05
        bezier = smoothOut, 0.36, 0, 0.66, -0.56
        bezier = smoothIn, 0.25, 1, 0.5, 1

        animation = windows, 1, 5, default
        animation = windowsOut, 1, 4, default, popin 80%
        animation = windowsMove, 1, 4, default
        animation = border, 1, 10, default
        animation = fade, 1, 10, smoothIn
        animation = fadeDim, 1, 10, smoothIn
        animation = workspaces, 1, 6, default
      }

      gestures {
        workspace_swipe = true
        workspace_swipe_fingers = 4
        workspace_swipe_distance = 250
        workspace_swipe_invert = true
        workspace_swipe_min_speed_to_force = 15
        workspace_swipe_cancel_ratio = 0.5
        workspace_swipe_create_new = false
      }

      misc {
        disable_autoreload = true
        disable_hyprland_logo = true
        always_follow_on_dnd = true
        layers_hog_keyboard_focus = true
        animate_manual_resizes = false
        enable_swallow = true
        swallow_regex =
        focus_on_activate = true
      }

      device:epic mouse V1 {
        sensitivity = -0.5
      }

      bind = $mainMod, F1, exec, bash $HOME/.config/hypr/keybind
      #bind = $mainMod,Return, exec, foot
      bind = $mainMod,Return, exec, foot -e tmux new -As0
      bind = $mainMod SHIFT, Return, exec, foot --app-id="termfloat"
      bind = $mainMod, E, exec, nemo
      bind = $mainMod, Q, killactive,
      bind = $mainMod SHIFT, Q, exit,
      bind = $mainMod SHIFT, Space, togglefloating,
      bind = $mainMod, F, fullscreen
      bind = $mainMod, Y, pin
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod, T, togglesplit, # dwindle

      #-----------------------#
      # Toggle grouped layout #
      #-----------------------#
      bind = $mainMod, U, togglegroup,
      bind = $mainMod, Tab, changegroupactive, f

      #------------#
      # change gap #
      #------------#
      bind = $mainMod SHIFT, G, exec, hyprctl --batch "keyword general:gaps_out 5;keyword general:gaps_in 3"
      bind = $mainMod, G, exec, hyprctl --batch "keyword general:gaps_out 0;keyword general:gaps_in 0"

      #--------------------------------------#
      # Move focus with mainMod + arrow keys #
      #--------------------------------------#
      bind = $mainMod, H, movefocus, l
      bind = $mainMod, L, movefocus, r
      bind = $mainMod, J, movefocus, u
      bind = $mainMod, K, movefocus, d

      #----------------------------------------#
      # Switch workspaces with mainMod + [0-9] #
      #----------------------------------------#
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10
      bind = $mainMod, up, workspace, +1
      bind = $mainMod, down, workspace, -1
      bind = $mainMod, period, workspace, e+1
      bind = $mainMod, comma, workspace,e-1

      #-------------------------------#
      # special workspace(scratchpad) #
      #-------------------------------# 
      bind = $mainMod, minus, movetoworkspace,special
      bind = $mainMod, equal, togglespecialworkspace

      #----------------------------------#
      # move window in current workspace #
      #----------------------------------#
      bind = $mainMod SHIFT, H, movewindow, l
      bind = $mainMod SHIFT, L, movewindow, r
      bind = $mainMod SHIFT, J, movewindow, u
      bind = $mainMod SHIFT, K, movewindow, d

      #---------------------------------------------------------------#
      # Move active window to a workspace with mainMod + ctrl + [0-9] #
      #---------------------------------------------------------------#
      bind = $mainMod CTRL, 1, movetoworkspace, 1
      bind = $mainMod CTRL, 2, movetoworkspace, 2
      bind = $mainMod CTRL, 3, movetoworkspace, 3
      bind = $mainMod CTRL, 4, movetoworkspace, 4
      bind = $mainMod CTRL, 5, movetoworkspace, 5
      bind = $mainMod CTRL, 6, movetoworkspace, 6
      bind = $mainMod CTRL, 7, movetoworkspace, 7
      bind = $mainMod CTRL, 8, movetoworkspace, 8
      bind = $mainMod CTRL, 9, movetoworkspace, 9
      bind = $mainMod CTRL, 0, movetoworkspace, 10
      bind = $mainMod CTRL, left, movetoworkspace, -1
      bind = $mainMod CTRL, right, movetoworkspace, +1
      # same as above, but doesnt switch to the workspace
      bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
      bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
      bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
      bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
      bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
      bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
      bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
      bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
      bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9
      bind = $mainMod SHIFT, 0, movetoworkspacesilent, 10
      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      #-------------------------------------------#
      # switch between current and last workspace #
      #-------------------------------------------#
      binds {
           workspace_back_and_forth = 1 
           allow_workspace_cycles = 1
      }
      bind=$mainMod,slash,workspace,previous

      #------------------------#
      # quickly launch program #
      #------------------------# 
      bind=$mainMod,B,exec,firefox
      bind=$mainMod SHIFT,X,exec,myswaylock
      bind=,Print,exec, grimblast --notify --cursor copy area
      bind=SHIFT,Print,exec, grimblast --notify --cursor copysave area ~/$(date "+%Y-%m-%d"T"%H:%M:%S").png
      bind=$mainMod,D,exec, pkill rofi || ~/.config/rofi/launcher.sh
      bind=$mainMod SHIFT,D,exec, bash ~/.config/rofi/powermenu.sh

      #-----------------------------------------#
      # control volume,brightness,media players-#
      #-----------------------------------------#
      bind=,XF86AudioRaiseVolume,exec, pamixer -i 5
      bind=,XF86AudioLowerVolume,exec, pamixer -d 5
      bind=,XF86AudioMute,exec, pamixer -t
      bind=,XF86AudioMicMute,exec, pamixer --default-source -t
      bind=,XF86MonBrightnessUp,exec, brightnessctl set 10%+
      bind=,XF86MonBrightnessDown, exec, brightnessctl set 10%-
      bind=,XF86AudioPlay,exec, playerctl play-pause
      bind=,XF86AudioPause,exec, playerctl play-pause
      bind=,XF86AudioNext,exec, playerctl next
      bind=,XF86AudioPrev,exec, playerctl previous

      #---------------#
      # waybar toggle #
      # --------------#
      bind=$mainMod,O,exec,killall -SIGUSR1 .waybar-wrapped

      #---------------#
      # resize window #
      #---------------#
      bind=$mainMod,R,submap,resize
      submap=resize
      binde=,right,resizeactive,15 0
      binde=,left,resizeactive,-15 0
      binde=,up,resizeactive,0 -15
      binde=,down,resizeactive,0 15
      binde=,l,resizeactive,15 0
      binde=,h,resizeactive,-15 0
      binde=,k,resizeactive,0 -15
      binde=,j,resizeactive,0 15
      bind=,escape,submap,reset 
      submap=reset

      bind=$mainMod SHIFT, left, resizeactive,-15 0
      bind=$mainMod SHIFT, right, resizeactive,15 0
      bind=$mainMod SHIFT, up, resizeactive,0 -15
      bind=$mainMod SHIFT, down, resizeactive,0 15
      bind=CTRL SHIFT, l, resizeactive, 15 0
      bind=CTRL SHIFT, h, resizeactive,-15 0
      bind=CTRL SHIFT, k, resizeactive, 0 -15
      bind=CTRL SHIFT, j, resizeactive, 0 15

      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      #-----------------------#
      # wall(by swww service) #
      #-----------------------#
      exec-once = swww-daemon && default_wall 

      #------------#
      # auto start #
      #------------#
      exec-once = launch_waybar &
      exec-once = mako &
      exec-once = nm-applet --indicator &
      exec-once = blueman-applet &
      exec-once = swayidle -w timeout 300 'myswaylock -f' timeout 600 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'myswaylock'

      #---------------#
      # windows rules #
      #---------------#
      #`hyprctl clients` get class、title...
      windowrule=float,menu
      windowrule=float,title:^(Picture-in-Picture)$
      windowrule=size 960 540,title:^(Picture-in-Picture)$
      windowrule=move 25%-,title:^(Picture-in-Picture)$
      windowrule=float,imv
      windowrule=move 25%-,imv
      windowrule=size 960 540,imv
      windowrule=float,mpv
      windowrule=pin,mpv
      windowrule=move 25%-,mpv
      windowrule=size 960 540,mpv
      windowrule = idleinhibit focus, mpv
      windowrule=float,termfloat
      windowrule=move 25%-,termfloat
      windowrule=size 960 540,termfloat
      windowrule=rounding 5,termfloat
      windowrule=float,nemo
      windowrule=move 25%-,nemo
      windowrule=size 960 540,nemo
      windowrule = float, obs
      windowrule=float,title:^(ssh-askpass)$  
      windowrule=noblur,^(firefox)$
      windowrule=noblur,^(chromium)$
      windowrulev2=float,class:^(firefox)$,title:^(Picture-in-Picture)$
      windowrulev2=pin,class:^(firefox)$,title:(?:Open|Save) (?:File|Folder|As)
      windowrulev2=float,class:^(firefox)$,title:(?:Open|Save) (?:File|Folder|As)
      windowrule=idleinhibit fullscreen,class:^(firefox)$
      windowrule = float, title:^(Firefox — Sharing Indicator)$
      windowrule = move 0 0, title:^(Firefox — Sharing Indicator)$
      windowrule=idleinhibit fullscreen,class:^(chromium)$
      windowrulev2=float,class:^(Sparrow)$,title:^(Wallet Password)
      windowrulev2=pin,class:^(Sparrow)$,title:^(Wallet Password)
      windowrulev2=float,class:^(org.keepassxc.KeePassXC$),
    '';
  };
}
