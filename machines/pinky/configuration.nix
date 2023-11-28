{
  imports = [
    ../../modules/nix.nix
    ../../modules/locale.nix
    ../../modules/gpg.nix
    ../../modules/pipewire.nix
    ../../modules/sysutils.nix
    ../../modules/fonts.nix
    ../../modules/flatpak.nix
    ../../modules/printer.nix
    ./services.nix
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  boot = {
    loader.systemd-boot = {
      enable = true;
      editor = false;
    };
  };

  networking = {
    hostName = "pinky";
    networkmanager.enable = true;
  };

  system.stateVersion = "24.05";
}
