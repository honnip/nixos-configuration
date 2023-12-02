{ pkgs, ... }: {
  programs.fish.enable = true;
  environment.systemPackages = with pkgs; [
    # network client
    curl
    wget

    # compressor
    zip
    unzip
    zstd
    lz4
    p7zip

    # monitoring
    lm_sensors
    smartmontools
    htop

    # nix
    nixfmt
    cachix

    # cli
    tree
    jq

    joycond
  ];
  services.fwupd.enable = true;
}
