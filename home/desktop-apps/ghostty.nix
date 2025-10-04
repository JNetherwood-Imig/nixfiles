{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    installVimSyntax = true;
    installBatSyntax = true;
    settings = {
      theme = "Gruvbox Dark";
      font-size = 16;
    };
  };
}
