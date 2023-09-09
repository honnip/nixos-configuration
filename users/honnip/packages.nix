{ pkgs, ... }: {
  home.packages = with pkgs; [

    # media
    ffmpeg
    imagemagick
    mpv

    # network
    tailscale

    discord
    element-desktop
    zoom-us
    tdesktop

    yt-dlp

    bitwarden
    obsidian

    bat
    ripgrep
    libreoffice
  ];
}
