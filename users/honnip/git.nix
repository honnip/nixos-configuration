{ config, ... }: {
  programs.git = {
    enable = true;
    userName = "honnip";
    userEmail = "git@honnip.page";
    delta.enable = true;
    delta.options = {
      line-numbers = true;
    };
    extraConfig = {
      diff = {colorMoved = "default"; };
      merge = { conflictstyle = "diff3"; };
      init = { defaultBranch = "main"; };
    };
  };
}
