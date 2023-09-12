{
  description = "NixOS system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, spicetify-nix, ... }:
    let
      base = {
        system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;
        nix.registry.nixos.flake = nixpkgs;
        imports = [ home-manager.nixosModules.home-manager ];
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      };
      gnome = { pkgs, ... }: {
        services.xserver.enable = true;
        services.xserver.displayManager.gdm.enable = true;
        services.xserver.desktopManager.gnome.enable = true;
        environment.gnome.excludePackages = (with pkgs; [ gnome-tour ])
          ++ (with pkgs.gnome; [
            geary # email reader
            tali # pocker game
            iagno # go game
            hitori # sudoku game
            atomix # puzzle game
            yelp # help view
            gnome-contacts
          ]);
        programs.dconf.enable = true;
        environment.systemPackages = with pkgs.gnome; [ gnome-tweaks ];
      };
    in {
      nixosConfigurations = {
        "acer" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            base
            gnome
            nixos-hardware.nixosModules.common-cpu-amd
            nixos-hardware.nixosModules.common-cpu-amd-pstate
            nixos-hardware.nixosModules.common-gpu-amd
            nixos-hardware.nixosModules.common-pc-laptop
            nixos-hardware.nixosModules.common-pc-laptop-ssd
            ./machines/acer_a315/configuration.nix
            ./users/honnip
            { home-manager.extraSpecialArgs = { inherit spicetify-nix; }; }
          ];
        };
      };
    };
}
