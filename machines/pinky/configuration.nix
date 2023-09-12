{ config, pkgs, lib, ... }: {
  imports = [
    ../../modules/nix.nix
    ../../modules/locale.nix
    ../../modules/pipewire.nix
    ../../modules/sysutils.nix
    ../../modules/fonts.nix
    ../../modules/flatpak.nix
    ./services.nix
    ./programs.nix
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

  system.stateVersion = "23.11";
}
