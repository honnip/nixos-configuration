{ pkgs, ... }: { home.packages = with pkgs; [ ffmpeg imagemagick mpv ]; }
