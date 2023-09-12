{ pkgs, ... }: {
  home.shellAliases = {
    nvmetmp = "sudo nvme smart-log /dev/nvme0n1 | rg ^temperature";
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
}
