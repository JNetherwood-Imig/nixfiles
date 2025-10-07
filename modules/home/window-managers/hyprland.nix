{
  lib,
  pkgs,
  inputs,
  window-managers,
  ...
}:
let
  hyprPkgs = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  config = lib.mkIf (builtins.elem "hyprland" window-managers) {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      package = hyprPkgs.hyprland;
      portalPackage = hyprPkgs.xdg-desktop-portal-hyprland;
      settings = {
        monitor = [
          "DP-1, 3440x1440@144, auto, 1.25"
        ];
        exec-once = [ ];
        general = {
          gaps_in = 5;
          gaps_out = 20;
          border_size = 1;
          resize_on_border = false;
          allow_tearing = false;
          layout = "dwindle";
        };
        decoration = {
          rounding = 10;
          shadow = {
            enabled = true;
            range = 10;
            render_power = 3;
          };
        };
        animations = {
          enabled = true;
          bezier = [
            "easeOutQuint,0.23,1,0.32,1"
            "easeInOutCubic,0.65,0.05,0.36,1"
            "linear,0,0,1,1"
            "almostLinear,0.5,0.5,0.75,1.0"
            "quick,0.15,0,0.1,1"
          ];
          animation = [
            "global, 1, 10, default"
            "border, 1, 5.39, easeOutQuint"
            "windows, 1, 4.79, easeOutQuint"
            "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
            "windowsOut, 1, 1.49, linear, popin 87%"
            "fadeIn, 1, 1.73, almostLinear"
            "fadeOut, 1, 1.46, almostLinear"
            "fade, 1, 3.03, quick"
            "layers, 1, 3.81, easeOutQuint"
            "layersIn, 1, 4, easeOutQuint, fade"
            "layersOut, 1, 1.5, linear, fade"
            "fadeLayersIn, 1, 1.79, almostLinear"
            "fadeLayersOut, 1, 1.39, almostLinear"
            "workspaces, 1, 1.94, almostLinear, fade"
            "workspacesIn, 1, 1.21, almostLinear, slide"
            "workspacesOut, 1, 1.94, almostLinear, slide"
          ];
        };
        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };
        render = {
          direct_scanout = 1;
          ctm_animation = 1;
        };
        xwayland = {
          enabled = true;
          force_zero_scaling = true;
        };
        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
        };
        input = {
          kb_layout = "us, es";
          repeat_rate = 35;
          repeat_delay = 350;
          follow_mouse = true;
          sensitivity = -0.5;
          accel_profile = "flat";
        };
        bind = [
          "Super, Return, exec, ${pkgs.ghostty}/bin/ghostty"
          "Super, D, exec, ${pkgs.rofi}/bin/rofi -show drun"
          "Super, W, exec, ${pkgs.firefox}/bin/firefox"
          "Super, E, exec, ${pkgs.zed-editor}/bin/zeditor"

          "Super, Q, killactive"
          "Control Alt, Delete, exit"
          "Super, V, togglefloating"
          "Super, F, fullscreen"
          "Super, P, pseudo"
          "Super, S, togglesplit"

          "Super, H, movefocus, l"
          "Super, L, movefocus, r"
          "Super, K, movefocus, u"
          "Super, J, movefocus, d"

          "Super Shift, H, movewindow, l"
          "Super Shift, L, movewindow, r"
          "Super Shift, K, movewindow, u"
          "Super Shift, J, movewindow, d"

          ", Print, exec, ${pkgs.hyprshot}/bin/hyprshot -m output --clipboard-only"
          "Shift , Print, exec, ${pkgs.hyprshot}/bin/hyprshot -m region --clipboard-only"
          "Control, Print, exec, ${pkgs.hyprshot}/bin/hyprshot -m window --clipboard-only"
          "Super, Print, exec, ${pkgs.hyprshot}/bin/hyprshot -m output -o ~/Pictures/Screenshots"
          "Super Shift, Print, exec, ${pkgs.hyprshot}/bin/hyprshot -m region -o ~/Pictures/Screenshots"
          "Super Control, Print, exec, ${pkgs.hyprshot}/bin/hyprshot -m window -o ~/Pictures/Screenshots"
        ]
        ++ (builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "Super, code:1${toString i}, workspace, ${toString ws}"
              "Super Shift, code:1${toString i}, movetoworkspace, ${toString ws}"
              "Super Control, code:1${toString i}, movetoworkspacesilent, ${toString ws}"
            ]
          ) 9
        ));
        bindm = [
          "Super, mouse:272, movewindow"
          "Super, mouse:273, resizewindow"
        ];
        bindl = [
          ", XF86AudioRaiseVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+"
          ", XF86AudioLowerVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"
          ", XF86AudioMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ", XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
          ", XF86AudioPause, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
          ", XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
          ", XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
        ];
        windowrulev2 = [
          "suppressevent maximize, class:.*"
          "nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
        ];
      };
    };

    home.sessionVariables = {
      HYPRCURSOR_THEME = "rose-pine-hyprcursor";
      HYPRCURSOR_SIZE = "32";
    };
    home.packages = [
      pkgs.rose-pine-hyprcursor
    ];
  };
}
