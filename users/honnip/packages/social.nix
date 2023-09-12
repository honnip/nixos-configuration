{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord
    element-desktop
    zoom-us
    tdesktop
    thunderbird
  ];
}
