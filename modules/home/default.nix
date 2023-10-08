{ config, ... }: {
    home.stateVersion = "23.11";
    imports = [
      ./hyprland.nix
      ./desktop.nix
    ];
}
