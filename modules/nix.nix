{
  nix = {
    settings = {
      trusted-users = [ "root" "@wheel" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
    extraOptions = "
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    ";
  };
}
