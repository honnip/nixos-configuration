{ ... }: {
  programs.vscode.enable = true;
  programs.firefox.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.fish.enable = true; # let home-manager manages fish shell
  programs.home-manager.enable = true;
}
