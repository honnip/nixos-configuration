{ pkgs, ... }: {
  home.packages = with pkgs; [
    obs-studio

    bitwarden

    discord
    fractal
    zoom-us
    tdesktop
    thunderbird

    libreoffice
    obsidian
  ];

  programs.vscode.enable = true;
  programs.firefox.enable = true;
}
