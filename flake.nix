{
  description = "NixOS system configuration";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-hardware, home-manager, ... }:
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
          ];
        };
        "pinky" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            base
            gnome
            nixos-hardware.nixosModules.common-cpu-amd
            nixos-hardware.nixosModules.common-cpu-amd-pstate
            nixos-hardware.nixosModules.common-gpu-amd
            nixos-hardware.nixosModules.common-pc
            nixos-hardware.nixosModules.common-pc-ssd
            ./machines/pinky/configuration.nix
            ./users/honnip
          ];
        };
      };
    };
}
