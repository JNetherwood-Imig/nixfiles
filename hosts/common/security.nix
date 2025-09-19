{ ... }:

{
  security.polkit.enable = true;
  security.soteria.enable = true; # GTK4 polkit authentication agent
  services.gnome.gnome-keyring.enable = true;
}
