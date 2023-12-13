{ pkgs, ... }: {
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';
  home.packages = with pkgs; [ kanata ];
  systemd.user.services.kanata = {
    Unit = {
      Description = "Kanata keyboard remapper";
      Documentation = "https://github.com/jtroo/kanata";
    };
    Service = {
      ExecStart = "${pkgs.kanata}/bin/kanata";
      Restart = "no";
    };
    Install.WantedBy = [ "default.target" ];
  };
}
