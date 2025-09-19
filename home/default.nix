{ ... }:

{
  fish.enable = true;
  git.enable = true;
  nvim.enable = true;
  secrets.enable = true;
  terminalUtils.enable = true;
  theme.enable = true;

  desktopApps = {
    # cheatbreaker.enable = true;
    firefox.enable = true;
    ghostty.enable = true;
    protonPass.enable = true;
    rofi.enable = true;
    spotify.enable = true;
    swww.enable = true;
    vesktop.enable = true;
    zed.enable = true;
  };

  windowManagers.hyprland.enable = true;

  home.stateVersion = "25.05";
  home.username = "jackson";
  home.homeDirectory = "/home/jackson";
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
