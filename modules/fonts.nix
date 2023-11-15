{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    iosevka
    ibm-plex
    pretendard
    monaspace
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
}
