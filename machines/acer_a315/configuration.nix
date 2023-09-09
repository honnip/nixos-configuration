{ config, pkgs, lib, ... }: {
  imports = [
    ../../modules/nix.nix
    ../../modules/pipewire.nix
    ../../modules/sysutils.nix
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

  environment.variables = {
    MOZ_ENABLE_WAYLAND="1";
    #GTK_IM_MODULE="ibus";
    #QT_IM_MODULE="ibus";
    #XMODIFIERS="@im=ibus";    
  };
}
