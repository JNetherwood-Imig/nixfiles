{
  imports = [
    ./cheatbreaker.nix
    ./darktable.nix
    ./proton-pass.nix
    ./spotify.nix
    ./swww.nix
    ./vesktop.nix
    ./zed.nix
  ];

  desktopApps = {
    browser = "zen";
    launcher = "rofi";
    terminal = "ghostty";
  };
}
