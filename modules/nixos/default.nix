{ config, pkgs, lib, ... }: {
    imports = [
        ./nix.nix
        ./user.nix
    ];
}
