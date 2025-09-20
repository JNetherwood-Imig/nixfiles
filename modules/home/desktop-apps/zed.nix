{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.desktopApps.zed;
in
{
  options.desktopApps.zed = {
    enable = lib.mkEnableOption "zed";
  };

  config = lib.mkIf cfg.enable {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "nix"
      ];
      extraPackages = with pkgs; [
        nixd
        nil
      ];
      userSettings = {
        vim_mode = true;
        ui_font_size = 16;
        buffer_font_size = 16;
        theme = {
          mode = "dark";
          light = "Gruvbox Light";
          dark = "Gruvbox Dark";
        };
      };
    };
  };
}
