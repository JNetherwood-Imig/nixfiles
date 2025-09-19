{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.secrets;
in
{
  options.secrets.enable = lib.mkEnableOption "secrets";
  config = lib.mkIf cfg.enable {
    sops = {
      defaultSopsFile = ./secrets/secrets.yaml;
      defaultSopsFormat = "yaml";

      age.keyFile = "/home/jackson/.config/sops/age/keys.txt";

      secrets = {
        github-ssh-key = {
          key = "github.ssh-key";
          format = "binary";
        };
      };
    };

    programs.ssh = {
      enable = true;
      extraConfig = ''
        Host github.com
          IdentityFile ${config.sops.secrets.github-ssh-key.path}
          IdentitiesOnly yes
      '';
    };

    home.packages = [ pkgs.sops ];
  };
}
