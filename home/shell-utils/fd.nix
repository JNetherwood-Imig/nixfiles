{
  programs.fd = {
    enable = true;
    extraOptions = [ "--color=always" ];
  };
  home.shellAliases.find = "fd";
}
