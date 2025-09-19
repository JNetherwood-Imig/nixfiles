{ config, lib, ... }:

let
  cfg = config.git;
in
{
  options.git = {
    enable = lib.mkEnableOption "git";
  };

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "JNetherwood-Imig";
      userEmail = "jacksonni752@gmail.com";
    };
  };
}
