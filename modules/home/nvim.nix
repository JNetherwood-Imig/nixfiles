{ config, lib, ... }:

let
  cfg = config.nvim;
in
{
  options.nvim = {
    enable = lib.mkEnableOption "nvim";
    defaultEditor = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable nvim as the default editor";
    };
    vimAlias = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Alias nvim as vim";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = cfg.defaultEditor;
      vimAlias = cfg.vimAlias;
    };
  };
}
