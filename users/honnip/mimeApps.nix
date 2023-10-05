{ ... }: {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/chrome" = "firefox.desktop";
      "text/html" = "firefox.desktop";
      "application/x-extension-htm" = "firefox.desktop";
      "application/x-extension-html" = "firefox.desktop";
      "application/x-extension-shtml" = "firefox.desktop";
      "application/xhtml+xml" = "firefox.desktop";
      "application/x-extension-xhtml" = "firefox.desktop";
      "application/x-extension-xht" = "firefox.desktop";

      "text/plain" = "org.gnome.TextEditor.desktop";
      "application/pdf" = "org.gnome.Evince.desktop";

      "audio/mp4" = "org.gnome.Totem.desktop";

      "x-scheme-handler/mailto" = "userapp-Thunderbird-TT1RA2.desktop";
    };
  };
}
