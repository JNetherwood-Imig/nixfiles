{ lib, ... }: {
  imports = [
    ./adwaita-dark.nix
    ./adwaita-light.nix
    ./catpuccin.nix
    ./everforest-dark.nix
    ./everforest-light.nix
    ./gruvbox.nix
  ];

  options.globalTheme = lib.mkOption {
    type = lib.types.enum [
      "adwaita-dark"
      "adwaita-light"
      "catpuccin"
      "everforest-dark"
      "everforest-light"
      "gruvbox"
    ];
  };
}
