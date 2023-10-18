{ pkgs, ... }: {
  imports = [
    ./social.nix
    ./desktop.nix
    ./develop.nix
    ./cli.nix
    ./media.nix
    ./document.nix
  ];
  home.packages = with pkgs;
    [
      # lsp
      nil
    ];
}
