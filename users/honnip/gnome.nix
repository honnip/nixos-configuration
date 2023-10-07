{ pkgs, ... }: {
  home.packages = with pkgs.gnomeExtensions;
    [
      alphabetical-app-grid
      appindicator
      blur-my-shell
      clipboard-history
      dock-from-dash
      just-perfection
      rounded-window-corners
      smile-complementary-extension
      tailscale-status
    ] ++ [ pkgs.gnome-firmware ];

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "AlphabeticalAppGrid@stuarthayhurst"
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
        "clipboard-history@alexsaveau.dev"
        "dock-from-dash@fthx"
        "just-perfection-desktop@just-perfection"
        "rounded-window-corners@yilozt"
        "smile-extension@mijorus.it"
        "tailscale-status@maxgallup.github.com"
      ];
    };
    "org/freedesktop/ibus/engine/hangul" = {
      "switch-keys" = "Hangul";
      "use-event-forwarding" = false;
    };
  };
}

