{ pkgs, ... }: {
  home.packages = with pkgs; [
    obs-studio

    goldwarden

    discord
    fractal
    zoom-us
    tdesktop
    thunderbird
    kiwitalk

    libreoffice
    obsidian
  ];

  programs.vscode.enable = true;
  programs.firefox.enable = true;
}
