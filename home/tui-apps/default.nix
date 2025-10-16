{
  imports = [
    ./bat.nix
    ./ripgrep.nix
    ./starship.nix
    ./zoxide.nix
  ];

  tuiApps = {
    editors = {
      default = "helix";
      helix.enable = true;
      nvim.enable = false;
    };
  };
}
