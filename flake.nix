{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
      ];

      flake = {
        # use "nixos", or your hostname as the name of the configuration
        nixosConfigurations.tour = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/tour/configuration.nix
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
          ];
        };

        nixosConfigurations.laptop = inputs.nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/laptop/configuration.nix
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
          ];
        };
      };

      perSystem = { config, self, inputs, pkgs, system, ... }: {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            nixfmt
          ];
        };
      };
    };
}
