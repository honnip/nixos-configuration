{ pkgs, ... }: {
  home.packages = with pkgs; [
    bat
    ripgrep
    fd
    helix

    yt-dlp

    openssl
    android-tools

    starship
    mcfly

    spicetify-cli
  ];
}
