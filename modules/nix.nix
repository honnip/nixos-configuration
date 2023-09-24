{
  nix = {
    settings = { trusted-users = [ "root" "@wheel" ]; };
    extraOptions = "experimental-features = nix-command flakes ";
  };
}
