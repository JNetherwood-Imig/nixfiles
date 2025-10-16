{ config, lib, ... }:
{
  config.programs.ghostty = lib.mkIf config.desktopApps.terminals.ghostty.enable {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    installVimSyntax = true;
    installBatSyntax = true;
    settings = {
      working-directory = "home";
      window-inherit-working-directory = false;
      window-padding-x = 10;
      window-padding-y = 10;
    };
  };
}
