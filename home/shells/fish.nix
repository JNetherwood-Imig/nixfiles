{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "${pkgs.eza}/bin/eza --color=always --icons=always --hyperlink --oneline";
      la = "${pkgs.eza}/bin/eza --color=always --icons=always --hyperlink --oneline --all";
      ll = "${pkgs.eza}/bin/eza --color=always --icons=always --hyperlink --git --long";
      lla = "${pkgs.eza}/bin/eza --color=always --icons=always --hyperlink --git --long --all";
      lt = "${pkgs.eza}/bin/eza --color=always --icons=always --hyperlink --tree";
      lg = "${pkgs.eza}/bin/eza --color=always --icons=always --hyperlink --tree --git-ignore";
    };
  };
}
