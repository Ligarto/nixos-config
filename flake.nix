{
  description = "NixOS configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-old.url = "github:nixos/nixpkgs/d407951447dcd00442e97087bf374aad70c04cea";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell?ref=v4.7.5";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:FlameFlag/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-old,
      home-manager,
      niri,
      noctalia,
      nvf,
      nixcord,
      ...
    }:
    let
      mkHost =
        hostname:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit
              niri
              noctalia
              nvf
              nixcord
              ;
          };
          modules = [
            ./configuration.nix
            ./programs.nix
            ./browser-policies.nix
            ./hosts/${hostname}/hardware-configuration.nix
            { networking.hostName = hostname; }
            {
              nixpkgs.overlays = [
                (
                  final: prev:
                  let
                    oldPkgs = import nixpkgs-old {
                      inherit (prev) config;
                      system = prev.stdenv.hostPlatform.system;
                    };
                  in
                  {
                    brave-origin = final.callPackage ./pkgs/brave-origin.nix { };
                    sddm-theme = final.callPackage ./pkgs/sddm-theme.nix { };
                    libdisplay-info_0_2 = oldPkgs.libdisplay-info_0_2;
                  }
                )
              ];
            }
            niri.nixosModules.niri
            home-manager.nixosModules.home-manager
            (
              { config, ... }:
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = {
                  inherit
                    niri
                    noctalia
                    nvf
                    nixcord
                    ;
                  hostName = config.networking.hostName;
                };
                home-manager.users.ligarto = import ./home/default.nix;
                home-manager.backupFileExtension = "bak";
              }
            )
          ];
        };
    in
    {
      nixosConfigurations.gaia = mkHost "gaia";
      nixosConfigurations.chaos = mkHost "chaos";
    };
}
