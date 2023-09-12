{ pkgs, ... }: {
  imports = [ ./social.nix ./desktop.nix ./cli.nix ./media.nix ./document.nix ];
  home.packages = with pkgs;
    [
      # lsp
      nil
    ];
}
