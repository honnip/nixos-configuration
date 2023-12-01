{ pkgs, ... }: {
  home.packages = with pkgs; [
    discord
    fractal
    zoom-us
    tdesktop
    thunderbird
  ];
}
