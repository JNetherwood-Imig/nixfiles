{
  pkgs,
  ...
}:

{

    programs.zed-editor = {
      enable = true;
      extensions = [
        "nix"
        "toml"
      ];
      extraPackages = with pkgs; [
        nixd
        nil
      ];
      userSettings = {
        vim_mode = true;
        helix_mode = true;
        ui_font_size = 16;
        buffer_font_size = 16;
        theme = {
          mode = "dark";
          light = "Gruvbox Light";
          dark = "Gruvbox Dark";
        };
    };
  };
}
