{ ... }: {
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # firefox
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

      "application/zip" = "org.gnome.FileRoller.desktop";

      # video & audio
      "audio/mp4" = "org.gnome.Totem.desktop";
      "video/mp4" = "org.gnome.Totem.desktop";
      "video/webm" = "org.gnome.Totem.desktop";
      

      # image
      "image/jpeg" = "org.gnome.Loupe.desktop";
      "image/png" = "org.gnome.Loupe.desktop";
      "image/avif" = "org.gnome.Loupe.desktop";
      "image/gif" = "org.gnome.Loupe.desktop";
      "image/webp" = "org.gnome.Loupe.desktop";
      "image/svg+xml" = "org.gnome.Loupe.desktop";

      "x-scheme-handler/mailto" = "userapp-Thunderbird-TT1RA2.desktop";
      "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
    };
  };
}
