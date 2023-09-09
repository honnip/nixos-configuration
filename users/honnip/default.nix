{ ... }: {
  users.users.honnip = {
    isNormalUser = true;
    home = "/home/honnip";
    extraGroups = [ "wheel" "audio" "video" "networkmanager" ];
  };

  home.username = "honnip";
  home.homeDirectory = "/home/honnip";

  home-manager.users.honnip = {
    imports = [
      ./gnome.nix
      ./flatpak.nix
      ./shell.nix
      ./git.nix
      ./packages.nix
      ./wayland.nix
      ./programs.nix
      ./mimeApps.nix
    ];

    home.stateVersion = "23.05";
  };
}
