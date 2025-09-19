{ ... }:

{
  imports = [
    ./env
    ./boot-loader.nix
    ./greeter.nix
    ./jackson.nix
    ./monitors.nix
    ./nh.nix
    ./polkit.nix
    ./printing.nix
  ];
}
