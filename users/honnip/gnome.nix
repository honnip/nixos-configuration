{ pkgs, ... }: {
  home.packages = with pkgs; [
    gnomeExtensions.appindicator
    gnomeExtensions.tailscale-status
    gnomeExtensions.clipboard-history
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dock-from-dash
    gnomeExtensions.just-perfection
    gnomeExtensions.rounded-window-corners
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.smile-complementary-extension
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
    };

    enabled-extensions = [];
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gnome ];
  };
}

