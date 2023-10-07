{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    difftastic
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
