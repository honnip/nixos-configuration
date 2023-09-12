{ pkgs, ... }: {
  home.packages = with pkgs; [
    bat
    ripgrep
    fd
    helix
    yt-dlp
    starship
    mcfly

    spicetify-cli
  ];
}
