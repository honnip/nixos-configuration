{ pkgs, ... }: {
  imports =
    [ ./desktop.nix ./develop.nix ./cli.nix ./media.nix ];
  home.packages = with pkgs;
    [
      # lsp
      nil

      kanata
    ];
}
