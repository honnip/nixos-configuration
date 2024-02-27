{ pkgs, ... }: {
  # java
  programs.java = {
    enable = true;
    package = pkgs.openjdk;
  };

  home.packages = with pkgs; [ ccache ];
}
