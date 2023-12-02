{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellAbbrs = {
      nvmetmp = "sudo nvme smart-log /dev/nvme0n1 | rg ^temperature";
    };
    plugins = [
      # {
      #   name = "fish-async-prompt";
      #   src = pkgs.fishPlugins.async-prompt.src;
      # }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "colored-man-pages";
        src = pkgs.fishPlugins.colored-man-pages.src;
      }
    ];
  };
  programs.starship.enable = true;
  programs.mcfly.enable = true;
}
