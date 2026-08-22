{
  description = "old-laptop NixOS configuration";

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
    {
      nixosConfigurations.old-laptop = nixpkgs.lib.nixosSystem {
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
          {
            nixpkgs.overlays = [
              (
                final: prev:
                let
                  oldPkgs = import nixpkgs-old {
                    inherit (prev) system;
                    config.allowUnfree = true;
                  };
                in
                {
                  brave-origin = final.callPackage ./pkgs/brave-origin.nix { };
                  sddm-theme = final.callPackage ./pkgs/sddm-theme.nix { };
                  libdisplay-info_0_2 = oldPkgs.libdisplay-info_0_2; # exact old version niri's build script requires
                }
              )
            ];
          }
          niri.nixosModules.niri
          home-manager.nixosModules.home-manager
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
            };
            home-manager.users.ligarto = import ./home/default.nix;
            home-manager.backupFileExtension = "bak";
          }
        ];
      };
    };
}
