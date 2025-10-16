{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.desktopApps.editors.zed.enable {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "nix"
        "toml"
      ];
      userSettings = {
        vim_mode = true;
        helix_mode = true;
      };
    };
    home.packages = with pkgs; [
      nixd
      nil
    ];
  };
}
