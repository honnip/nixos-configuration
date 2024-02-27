{ pkgs, ... }: {
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

      $env.PATH = ($env.PATH |
      split row (char esep) |
      append /home/honnip/.local/bin |
      append /home/honnip/.deno/bin
      )
      $env.EDITOR = hx
    '';
  };

  home.packages = with pkgs; [ fzf ];

  programs.carapace.enable = true;
  programs.starship.enable = true;
  programs.mcfly.enable = true;
  programs.zoxide.enable = true;
}
