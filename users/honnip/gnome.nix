{ pkgs, ... }: {
  home.packages = with pkgs.gnomeExtensions;
    [
      alphabetical-app-grid
      appindicator
      blur-my-shell
      dock-from-dash
      just-perfection
      pano
      rounded-window-corners
      smile-complementary-extension
      tailscale-status
    ] ++ [ pkgs.gnome-firmware ];

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      # gsettings get org.gnome.shell asdf
      enabled-extensions = [
        "AlphabeticalAppGrid@stuarthayhurst"
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
        "dock-from-dash@fthx"
        "just-perfection-desktop@just-perfection"
        "pano@elhan.io"
        "rounded-window-corners@yilozt"
        "smile-extension@mijorus.it"
        "tailscale-status@maxgallup.github.com"
      ];
    };
    "org/gnome/mutter" = {
      "experimental-features" = [ "scale-monitor-framebuffer" ];
    };
    "org/freedesktop/ibus/engine/hangul" = {
      "switch-keys" = "Hangul";
      "use-event-forwarding" = false;
    };
  };
}

