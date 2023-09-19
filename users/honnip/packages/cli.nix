{ pkgs, ... }: {
  home.packages = with pkgs; [
    bat
    ripgrep
    fd
    helix
    yt-dlp

    openssl

    starship
    mcfly

    spicetify-cli
  ];
}
