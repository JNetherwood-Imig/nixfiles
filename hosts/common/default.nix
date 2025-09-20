{ ... }:

{
  default = {
    imports = [
      ./boot-loader.nix
      ./config.nix
      ./direnv.nix
      ./env.nix
      ./fonts.nix
      ./nh.nix
      ./printing.nix
      ./rustup.nix
      ./security.nix
      ./user.nix
    ];
  };

  exports = import ./exports.nix;
}
