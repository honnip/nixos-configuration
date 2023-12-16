{
  programs.nushell = {
    enable = true;
    extraConfig = ''
      $env.config = {
        show_banner: false
        completions: {
          algorithm: "fuzzy"
        }

        history: {
          max_size: 100_000
          file_format: "sqlite"
        }

        rm: {
          always_trash: true
        }
      }
    '';
  };

  programs.carapace.enable = true;
  programs.starship.enable = true;
  programs.mcfly.enable = true;
}
