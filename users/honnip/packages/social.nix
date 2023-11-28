{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord
    # element-desktop
    fractal
    zoom-us
    tdesktop
    thunderbird
  ];
}
