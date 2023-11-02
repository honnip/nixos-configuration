{ pkgs, ... }: {
  home.packages = with pkgs; [ obs-studio bitwarden ];

  programs.vscode.enable = true;
  programs.firefox.enable = true;
}
