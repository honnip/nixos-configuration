{ pkgs, config, ... }@args: {
  users.users.honnip = {
    description = "J seungwoo";
    home = "/home/honnip";
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "networkmanager" ];
  };

  home-manager.users.honnip = {
    imports = [
      ./gnome.nix
      ./shell.nix
      ./dotfiles.nix
      ./packages
      ./wayland.nix
      ./services.nix
      ./mimeApps.nix
    ];
    home.username = "honnip";
    home.homeDirectory = "/home/honnip";
    xdg.userDirs = {
      enable = true;
      createDirectories = true;
    };

    home.stateVersion = "23.11";
  };
}
