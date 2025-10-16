{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rustup
    zig
    zls
    zig-zlint
  ];
}
