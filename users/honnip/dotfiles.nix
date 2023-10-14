{
  home.file = {
    ".cargo/config.toml".source = ./dotfiles/.cargo/config.toml;
    ".ssh/config".source = ./dotfiles/.ssh/config;
    ".config" = {
      source = ./dotfiles/.config;
      recursive = true;
    };
  };
}
