# TODO niri-flake issues
# spawn attributes DNE (repeat, allow-inhibit, allow-when-locked)
# move-window-to-workspace DNE
# screenshot-screen DNE
# screenshot write-to-disk DNE?
{
  config,
  lib,
  pkgs,
  window-managers,
  ...
}:
let
  border-radius = 0.0;
in {
  config.programs.niri = lib.mkIf window-managers.niri.enable {
    enable = true;
    package = pkgs.niri-unstable;
    settings = {
      hotkey-overlay.skip-at-startup = true;
      prefer-no-csd = true;
      screenshot-path = "~/Pictures/Screenshots/Screenshot_%Y-%m-%d_%H:%M:%S.png"
      input = {
        keyboard = {
          xkb.layout = "us,es";
          repeat-delay = 350;
          repeat-rate = 35;
        };
        mouse = {
          accel-profile = "flat";
        };
        touchpad = {
          dwt = true;
          natural-scroll = true;
          click-method = "clickfinger";
        };
        warp-mouse-to-focus.enable = true;
        power-key-handling.enable = false;
      };
      outputs."DP-1" = {
        mode = {
          width = 3440;
          height = 1440;
        };
        scale = 1.25;
      };
      layout = {
        gaps = 16;
        center-focused-column = "never";
        preset-column-widths = [
          { proportion = 1. / 3.; }
          { proportion = 1. / 2.; }
          { proportion = 2. / 3.; }
          { proportion = 2. / 2.; } # yes this is dumb but it pleases my brain
        ];
        default-column-width = { proportion = 1. / 2. };
        focus-ring.enable = false;
        border = {
          enable = true;
          width = 2;
        };
        shadow = {
          enable = true;
          softness = 10;
          spread = 5;
          offset = {
            x = 0;
            y = 5;
          };
          color = "#0008";
        };
      };
      animations = {}; # TODO? niri has pretty nice defaults
      window-rules = [
        {
          matches = [
            { app-id = "firefox$"; }
            { title = "^Picture-in-Picture$"; }
          ];
        }
        {
          geometry-corner-radius = {
            bottom-left = border-radius;
            bottom-right = border-radius;
            top-left = border-radius;
            top-right = border-radius;
          };
          clip-to-geometry = true;
        }
      ];
      binds = with config.lib.niri.actions; {
        "Mod+Shift+Slash".action = show-hotkey-overlay;

        "Mod+Return".action = spawn lib.strings.splitString " " "${config.desktopApps.terminals.defaultCmd}"; # { repeat = false; };
        "Mod+D".action = spawn lib.strings.splitString " " "${config.desktopApps.launchers.defaultCmd}"; # { repeat = false; };
        "Mod+W".action = spawn lib.strings.splitString " " "${config.desktopApps.browsers.defaultCmd}"; # { repeat = false; };

        "Mod+O".action = toggle-overview; # { repeat = false; };

        "Mod+Q".action = close-window; # { repeat = false; };

        "XF86AudioRaiseVolume".action = spawn [ "${pkgs.wireplumber}/bin/wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "1%+" ]; # { allow-when-locked=true; };
        "XF86AudioLowerVolume".action = spawn [ "${pkgs.wireplumber}/bin/wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "1%+" ]; # { allow-when-locked=true; };
        "XF86AudioMute".action = spawn [ "${pkgs.wireplumber}/bin/wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ]; # { allow-when-locked=true; };
        "XF86AudioMicMute".action = spawn [ "${pkgs.wireplumber}/bin/wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle" ]; # { allow-when-locked=true; };

        "XF86AudioPlay".action = spawn [ "${pkgs.playerctl}/bin/playerctl" "play-pause" ]; # { allow-when-locked=true; };
        "XF86AudioPrev".action = spawn [ "${pkgs.playerctl}/bin/playerctl" "previous" ]; # { allow-when-locked=true; };
        "XF86AudioNext".action = spawn [ "${pkgs.playerctl}/bin/playerctl" "next" ]; # { allow-when-locked=true; };

        "Mod+H".action = focus-column-left;
        "Mod+J".action = focus-window-down;
        "Mod+K".action = focus-window-up;
        "Mod+L".action = focus-column-right;

        "Mod+Shift+H".action = move-column-left;
        "Mod+Shift+J".action = move-window-down;
        "Mod+Shift+K".action = move-window-up;
        "Mod+Shift+L".action = move-column-right;

        "Mod+Ctrl+H".action = focus-monitor-left;
        "Mod+Ctrl+J".action = focus-monitor-down;
        "Mod+Ctrl+K".action = focus-monitor-up;
        "Mod+Ctrl+L".action = focus-monitor-right;

        "Mod+Shift+Ctrl+H".action = move-column-to-monitor-left;
        "Mod+Shift+Ctrl+J".action = move-column-to-monitor-down;
        "Mod+Shift+Ctrl+K".action = move-column-to-monitor-up;
        "Mod+Shift+Ctrl+L".action = move-column-to-monitor-right;

        "Mod+Home".action = focus-column-first;
        "Mod+End".action = focus-column-last;
        "Mod+Shift+Home".action = move-column-to-first;
        "Mod+Shift+End".action = move-column-to-last;

        "Mod+U".action = focus-workspace-down;
        "Mod+I".action = focus-workspace-up;

        "Mod+Shift+U".action = move-column-to-workspace-down;
        "Mod+Shift+I".action = move-column-to-workspace-up;

        "Mod+Ctrl+U".action = move-workspace-down;
        "Mod+Ctrl+I".action = move-workspace-up;

        "Mod+1".action = focus-workspace 1;
        "Mod+2".action = focus-workspace 2;
        "Mod+3".action = focus-workspace 3;
        "Mod+4".action = focus-workspace 4;
        "Mod+5".action = focus-workspace 5;
        "Mod+6".action = focus-workspace 6;
        "Mod+7".action = focus-workspace 7;
        "Mod+8".action = focus-workspace 8;
        "Mod+9".action = focus-workspace 9;

        # "Mod+Ctrl+1".action = move-window-to-workspace 1;
        # "Mod+Ctrl+2".action = move-window-to-workspace 2;
        # "Mod+Ctrl+3".action = move-window-to-workspace 3;
        # "Mod+Ctrl+4".action = move-window-to-workspace 4;
        # "Mod+Ctrl+5".action = move-window-to-workspace 5;
        # "Mod+Ctrl+6".action = move-window-to-workspace 6;
        # "Mod+Ctrl+7".action = move-window-to-workspace 7;
        # "Mod+Ctrl+8".action = move-window-to-workspace 8;
        # "Mod+Ctrl+9".action = move-window-to-workspace 9;

        "Mod+BracketLeft".action = consume-or-expel-window-left;
        "Mod+BracketRight".action = consume-or-expel-window-right;

        "Mod+Comma".action = consume-window-into-column;
        "Mod+Period".action = expel-window-from-column;

        "Mod+R".action = switch-preset-column-width;
        "Mod+Shift+R".action = expand-column-to-available-width;

        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;

        "Mod+C".action = center-column;
        "Mod+Shift+C".action = center-visible-columns;

        "Mod+Minus".action = set-column-width "-10%";
        "Mod+Equal".action = set-column-width "+10%";

        "Mod+Shift+Minus".action = set-window-height "-10%";
        "Mod+Shift+Equal".action = set-window-height "+10%";

        "Mod+V".action = toggle-window-floating;
        "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;

        "Mod+Space".action = switch-layout "next";
        "Mod+Shift+Space".action = switch-layout "prev";

        # "Print".action = screenshot-screen { write-to-disk = false; };
        "Shift+Print".action = screenshot { write-to-disk = false; show-pointer = false; };
        "Ctrl+Print".action = screenshot-window { write-to-disk = false; };
        # "Mod+Print".action = screenshot-screen;
        "Mod+Shift+Print".action = screenshot { show-pointer = false; };
        "Mod+Ctrl+Print".action = screenshot-window;

        "Mod+Escape".action = toggle-keyboard-shortcuts-inhibit; # { allow-inhibiting = false; };

        "Ctrl+Alt+Delete".action = quit;

        "Mod+Shift+P".action = power-off-monitors;
      };
    };
  };
}
