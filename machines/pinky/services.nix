{
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };

  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" ];
  };
}
