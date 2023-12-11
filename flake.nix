{
  outputs = inputs @ { flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } ({ inputs, ... }: {
      imports = [
        inputs.lite-system.flakeModule
      ];

      config.lite-system = {
        nixpkgs = {
          overlays = [ inputs.emacs-overlay.overlays.emacs ];
        };

        systemModule = ./system;
        homeModule = ./home;
        hostModuleDir = ./host;

        hosts = {
          darwin = {
            system = "aarch64-darwin";
          };
        };
      };
    });

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    lite-system.url = "github:yelite/lite-system";

    # https://github.com/lnl7/nix-darwin
    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # https://github.com/nix-community/home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # https://github.com/nix-community/emacs-overlay
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay/ead33b53bddac6d9e4e01d1e80e6dc1d8d30d2a3";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

}
