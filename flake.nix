{
  description = "NixOS system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nigpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = {self, nixpkgs, home-manager, nixos-hardware, ... }:
    let
      base = {
        imports = [
          home-manager.nixosModules.home-manager
        ];
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;
        nix.registry.nixos.flake = nixpkgs;
      };
      gnome = { pkgs, ... }: {
        services.xserver.enable = true;
        services.xserver.displayManager.gdm.enable = true;
        services.xserver.desktopManager.gnome.enable = true;
        environment.gnome.excludePackages = (with pkgs; [
          gnome-tour
        ]) ++ (with pkgs.gnome; [
          geary # email reader
          tali # pocker game
          iagno # go game
          hitori # sudoku game
          atomix # puzzle game
          yelp # help view
          gnome-contacts
        ]);
        programs.dconf.enable = true;
        environment.systemPackages = with pkgs.gnome; [
          gnome-tweaks
        ];
      };
    in {
      nixosConfigurations = {
        "acer" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            base
            gnome
            nixos-hardware.nixosModules.cpu.amd
            nixos-hardware.nixosModules.cpu.amd.pstate
            nixos-hardware.nixosModules.gpu.amd
            nixos-hardware.nixosModules.pc.laptop
            nixos-hardware.nixosModules.pc.ssd
            ./machines/acer_a315/configuration.nix
            ./users/honnip
          ];
        };
      };
    };
}
