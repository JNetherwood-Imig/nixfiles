{ config, lib, ... }: {
  programs.ghostty = lib.mkIf (config.desktopApps.terminal == "ghostty"){
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    installVimSyntax = true;
    installBatSyntax = true;
    settings = {
      theme = "Gruvbox Dark";
      font-size = 16;
    };
  };
}
