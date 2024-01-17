{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    # network client
    curl
    wget

    # compressor
    zip
    unzip
    zstd
    lz4
    _7zz

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
