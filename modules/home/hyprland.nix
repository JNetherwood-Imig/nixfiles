{ config, ... }: {
  config = {
    wayland.windowManager.hyprland = {
      enable = true;
      recommendedEnvironment = true;
      systemdIntegration = true;
      extraConfig = ''

        
        # Autostart
        exec-once = swww init
        
        # Monitors
        monitor=DP-1,1920x1080@165,1920x0,1
        monitor=DP-2,1920x1080@60,0x0,1

        # Environment variables
        env = XCURSOR_SIZE,24
        env = WLR_NO_HARDWARE_CURSORS,1
        env = XDG_SESSION_TYPE,wayland
        env = EDITOR,nvim
        env = NIXOS_OZONE_WL,1

        # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
        input {
            kb_layout = us

            follow_mouse = 1

            sensitivity = 0
        }

        general {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more

            gaps_in = 4
            gaps_out = 8
            border_size = 4
            col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
            col.inactive_border = rgba(595959aa)

            layout = master
        }

        decoration {

            rounding = 0

            blur {
              enabled = true
              size = 3
              passes = 2
            }

            drop_shadow = no
            shadow_range = 4
            shadow_render_power = 3
            col.shadow = rgba(1a1a1aee)
        }

        animations {
            enabled = yes

            bezier = myBezier, 0.05, 0.9, 0.1, 1.05

            animation = windows, 1, 4, myBezier, slide
            animation = windowsOut, 1, 4, default, slide
            animation = border, 1, 10, default
            animation = borderangle, 1, 4, default
            animation = fade, 1, 4, default
            animation = workspaces, 1, 5, default
        }

        dwindle {
            # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
            pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
            preserve_split = yes # you probably want this
        }

        master {
            new_is_master = false
	    mfact = 0.5
        }

        gestures {
            workspace_swipe = off
        }

        # Binds
        $mainMod = SUPER

        bind = $mainMod, RETURN, exec, alacritty
        bind = $mainMod, Q, killactive, 
        bind = $mainMod SHIFT, M, exit, 
        bind = $mainMod, E, exec, thunar
        bind = $mainMod, V, togglefloating, 
        bind = $mainMod, D, exec, rofi -show drun -show-icons
        bind = $mainMod, P, pseudo, # dwindle
        bind = $mainMod, J, togglesplit, # dwindle
	bind = $mainMod, W, exec, firefox

        # Move focus with mainMod + arrow keys
        bind = $mainMod, left, movefocus, l
        bind = $mainMod, right, movefocus, r
        bind = $mainMod, up, movefocus, u
        bind = $mainMod, down, movefocus, d

        # Switch workspaces with mainMod + [0-9]
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

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        bind = $mainMod SHIFT, 1, movetoworkspace, 1
        bind = $mainMod SHIFT, 2, movetoworkspace, 2
        bind = $mainMod SHIFT, 3, movetoworkspace, 3
        bind = $mainMod SHIFT, 4, movetoworkspace, 4
        bind = $mainMod SHIFT, 5, movetoworkspace, 5
        bind = $mainMod SHIFT, 6, movetoworkspace, 6
        bind = $mainMod SHIFT, 7, movetoworkspace, 7
        bind = $mainMod SHIFT, 8, movetoworkspace, 8
        bind = $mainMod SHIFT, 9, movetoworkspace, 9
        bind = $mainMod SHIFT, 0, movetoworkspace, 10

        # Scroll through existing workspaces with mainMod + scroll
        bind = $mainMod, mouse_down, workspace, e+1
        bind = $mainMod, mouse_up, workspace, e-1

        # Move/resize windows with mainMod + LMB/RMB and dragging
        bindm = $mainMod, mouse:272, movewindow
        bindm = $mainMod, mouse:273, resizewindow

	# Audio
	binde = , XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
	binde = , XF86AudioLowerVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-
	bind = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      '';
    };
  };
}
