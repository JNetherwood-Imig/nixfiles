{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.desktopApps.cheatbreaker;
in
{
  options.desktopApps.cheatbreaker.enable = lib.mkEnableOption "cheatbreaker";
  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.cheatbreaker ];
    home.file.".cheatbreaker/launcher/settings.json" = {
      source = ''
        {
          "ram": 16384,
          "version": "1.8.9",
          "launch_action": "keep",
          "close_action": "keep",
          "crash_action": "diagnostics",
          "error_action": "ignore",
          "game_dir": "/home/jackson/.minecraft",
          "pre_allocate_memory": false,
          "client_branch": "automatic",
          "client_automatic_branch": "master",
          "client_width": 854,
          "client_height": 480,
          "client_fullscreen": false,
          "jre_dir": "/home/jackson/.cheatbreaker/jre/bin/java",
          "downloads_dir": "/home/jackson/.cheatbreaker/downloads",
          "jvm_args": "-Dorg.lwjgl.glfw.libname=${pkgs.glfw-wayland-minecraft}/lib/libglfw.so",
          "installation_id": "a8330f0bc54f43cfbd1d1bc89b56e778",
          "servers": [
            "hypixel.net"
          ],
          "header": "dynamic",
          "hidden_settings": true
        }⏎
      '';
    };
  };
}
