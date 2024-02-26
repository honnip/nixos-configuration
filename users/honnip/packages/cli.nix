{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    difftastic
    delta
    bat
    ripgrep
    fd
    helix

    yt-dlp

    openssl
    android-tools

    spicetify-cli
  ];
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.home-manager.enable = true;
}
