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
    hostName = "acer";
    networkmanager.enable = true;
  };

  environment.sessionVariables = { MOZ_ENABLE_WAYLAND = "1"; };

  system.stateVersion = "23.11";
}
