{ ... }:

{
  default = {
    imports = [
      ./boot-loader.nix
      ./config.nix
      ./env.nix
      ./fonts.nix
      ./nh.nix
      ./printing.nix
      ./security.nix
      ./user.nix
    ];
  };

  exports = import ./exports.nix;
}
