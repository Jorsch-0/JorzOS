{
  description = "JorzOS NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stablepkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, stablepkgs, home-manager, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    nixos-overlays = [
      # Allow configurations to use pkgs.stable.<package-name>.
      (_: prev: {
        stable = import stablepkgs {
          inherit (prev) system;
          config.allowUnfree = true;
        };
      })
    ];
  in {
    nixosConfigurations = {
      ZhulongOS = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/Zhulong/configuration.nix
          { nixpkgs.overlays = nixos-overlays; }
        ];
      };
    };

    homeConfigurations = {
      zhulong = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/Zhulong/home.nix
          { nixpkgs.overlays = nixos-overlays; }
        ];
      };
    };
  };
}
