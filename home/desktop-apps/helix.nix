{ config, ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox";
    };
    # "ui.cursor.match" = {
    #   fg = base0A;
    #   modifiers = [ "underlined" ];
    # };
 };
}
