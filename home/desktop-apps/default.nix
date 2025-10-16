{ pkgs, ... }:
{
  imports = [
    ./obs.nix
  ];

  home.packages = with pkgs; [
    cheatbreaker
    darktable
  ];

  programs.spicetify.enable = true;
  programs.vesktop.enable = true;

  desktopApps = {
    browsers = {
      defaultCmd = "zen";
      zen.enable = true;
      firefox.enable = false;
    };
    editors = {
      defaultCmd = "zeditor";
      zed.enable = true;
    };
    launchers = {
      defaultCmd = "fuzzel";
      fuzzel.enable = true;
      rofi.enable = false;
    };
    terminals = {
      defaultCmd = "ghostty";
      alacritty.enable = true;
      foot.enable = true;
      ghostty.enable = true;
      kitty.enable = true;
    };
  };
}
