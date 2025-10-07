{ ... }:

{
  imports = [
    ./boot-loader.nix
    ./config.nix
    ./direnv.nix
    ./fonts.nix
    ./nh.nix
    ./printing.nix
    ./rustup.nix
    ./security.nix
    ./user.nix
  ];
}
