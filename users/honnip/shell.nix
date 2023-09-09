{ ... }: {
  home.shellAliases  ={
    nvmetmp = "sudo nvme smart-log /dev/nvme0n1 | rg ^temperature";
  };

  programs.fish = {
    enable = true;
  };
}
