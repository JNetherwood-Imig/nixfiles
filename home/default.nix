{
  imports = [
    ./desktop-apps
    ./tui-apps
    ./shells

    ./git.nix
    ./media-control.nix
    ./secrets.nix
    ./session-variables.nix
    ./theme.nix
  ];

  home.stateVersion = "25.05";
}
