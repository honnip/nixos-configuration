{ pkgs, ... }: {
  users.extraGroups.uinput = { };
  users.users.honnip = {
    description = "J seungwoo";
    home = "/home/honnip";
    shell = pkgs.nushell;
    isNormalUser = true;
    extraGroups =
      [ "wheel" "audio" "video" "input" "uinput" "cups" "networkmanager" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJPEHAfQ0Ad/AApCdvjxMTB+YB6WkT/UIVnfXfqn7swZ honnip@pinky"
    ];
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
