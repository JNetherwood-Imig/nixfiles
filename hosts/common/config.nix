{ ... }:

{
  env = {
    shells = {
      default = "fish";
      extraShells = [ ];
    };
    windowManagers = [
      "hyprland"
    ];
  };

  bootLoader = "systemd-boot";
  greeter = "sddm";

  jackson.enable = true;

  printing.enable = true;

  networking.networkmanager.enable = true;
  time.timeZone = "America/Los_Angeles";
  polkit.enable = true;
  services.openssh.enable = true;

  security.rtkit.enable = true;
  services.pipewire.enable = true;
  hardware.bluetooth.enable = true;

  hardware.graphics.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  nh.enable = true;

  # Fish enables this by default because some completions expect man -k,
  # but this is unbelievably slow
  documentation.man.generateCaches = false;
}
