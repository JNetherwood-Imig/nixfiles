{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.terminalUtils;
in
{
  options.terminalUtils = {
    enable = lib.mkEnableOption "terminal utils";
  };

  config = lib.mkIf cfg.enable {
    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    home.packages = with pkgs; [
      wget
      curl
      tree
      bat
      eza
    ];
  };
}
