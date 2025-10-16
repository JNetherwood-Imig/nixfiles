{ config, lib, ... }:
{
  config.programs.neovim = lib.mkIf config.tuiApps.editors.nvim.enable {
    enable = true;
    defaultEditor = (config.tuiApps.editors.default == "nvim");
  };
}
