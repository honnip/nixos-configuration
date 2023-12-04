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
      "image/avif" = "org.gnome.Loupe.desktop";
      "image/bmp" = "org.gnome.Loupe.desktop";
      "image/gif" = "org.gnome.Loupe.desktop";
      "image/heic" = "org.gnome.Loupe.desktop";
      "image/jpeg" = "org.gnome.Loupe.desktop";
      "image/jxl" = "org.gnome.Loupe.desktop";
      "image/png" = "org.gnome.Loupe.desktop";
      "image/svg+xml" = "org.gnome.Loupe.desktop";
      "image/svg_xml-compressed" = "org.gnome.Loupe.desktop";
      "image/tiff" = "org.gnome.Loupe.desktop";
      "image/vnd-microsoft.icon" = "org.gnome.Loupe.desktop";
      "image/vnd-ms.dds" = "org.gnome.Loupe.desktop";
      "image/webp" = "org.gnome.Loupe.desktop";
      "image/x-dds" = "org.gnome.Loupe.desktop";
      "image/x-exr" = "org.gnome.Loupe.desktop";
      "image/x-portable-bitmap" = "org.gnome.Loupe.desktop";
      "image/x-portable-graymap" = "org.gnome.Loupe.desktop";
      "image/x-portable-pixmap" = "org.gnome.Loupe.desktop";
      "image/x-portable-anymap" = "org.gnome.Loupe.desktop";
      "image/x-qoi" = "org.gnome.Loupe.desktop";
      "image/x-tga" = "org.gnome.Loupe.desktop";

      "x-scheme-handler/mailto" = "thunderbird.desktop";
      "text/calendar" = "thunderbird.desktop";

      "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
    };
  };
}
