{
  imports = [
    ./desktop-apps
    ./shells
    ./shell-utils

    ./env.nix
    ./fonts.nix
    ./git.nix
    ./helix.nix
    ./media-control.nix
    ./secrets.nix
    ./theme.nix
    ./xdg-desktop-portal.nix
  ];

  home.stateVersion = "25.05";
}
