{
  imports = [
    ./boot-loader.nix
    ./dev.nix
    ./direnv.nix
    ./hardware.nix
    ./printing.nix
    ./security.nix
    ./services.nix
    ./stylix.nix
    ./user.nix
  ];

  shells = {
    default = "fish";
    extraShells = [ "nushell" ];
  };

  greeter = "none";

  windowManagers = {
    hyprland.enable = true;
    niri.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
