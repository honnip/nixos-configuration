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
      "text/csv" = "org.gnome.TextEditor.desktop";
      "text/markdown" = "org.gnome.TextEditor.desktop";
      "text/xml" = "org.gnome.TextEditor.desktop";

      "application/pdf" = "org.gnome.Evince.desktop";

      "audio/mp4" = "org.gnome.Totem.desktop";
      "video/mp4" = "org.gnome.Totem.desktop";

      "image/jpeg" = "org.gnome.eog.desktop";
      "image/png" = "org.gnome.eog.desktop";
      "image/svg+xml" = "org.gnome.eog.desktop";

      "x-scheme-handler/mailto" = "userapp-Thunderbird-TT1RA2.desktop";
      "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
    };
  };
}
