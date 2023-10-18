{ pkgs, config, ... }: {
  services.printing = { enable = true; };
  services.avahi = {
    enable = true;
    nssmdns = false; # use mdns4
    openFirewall = true;
  };

  system.nssModules = with pkgs.lib;
    optional (!config.services.avahi.nssmdns) pkgs.nssmdns;
  system.nssDatabases.hosts = with pkgs.lib;
    optionals (!config.services.avahi.nssmdns) (mkMerge [
      (mkOrder 900
        [ "mdns4_minimal [NOTFOUND=return]" ]) # must be before resolve
      (mkOrder 1501 [ "mdns4" ]) # 1501 to ensure it's after dns
    ]);
}
