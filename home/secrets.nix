{ config, pkgs, ... }:
{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "/home/jackson/.config/sops/age/keys.txt";

    secrets = {
      github-ssh = {
        key = "github-ssh";
        format = "yaml";
      };
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      github = {
        host = "github.com";
        identityFile = "${config.sops.secrets.github-ssh.path}";
        identitiesOnly = true;
      };
    };
  };

  home.packages = [ pkgs.sops ];
}
