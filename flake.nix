{
  description = "JorzOS NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # stablepkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
  let
    system = "x86_64-linux";
    # pkgs = nixpkgs.legacyPackages.${system};
    # nixos-overlays = [
    #   # Allow configurations to use pkgs.stable.<package-name>.
    #   (_: prev: {
    #     stable = import stablepkgs {
    #       inherit (prev) system;
    #       config.allowUnfree = true;
    #     };
    #   })
    # ];
  in {
    nixosConfigurations = {
      ZhulongOS = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/Zhulong/configuration.nix
          # { nixpkgs.overlays = nixos-overlays; }

          # Enable Home Manager as NixOS module
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "bak";
            home-manager.extraSpecialArgs = {
              inherit inputs;
            };
            home-manager.users.jorsch = ./hosts/Zhulong/home.nix;
          }
        ];
      };
    };

    # homeConfigurations = {
    #   zhulong = home-manager.lib.homeManagerConfiguration {
    #     inherit pkgs;
    #     extraSpecialArgs = {
    #       inherit inputs;
    #     };
    #     modules = [
    #       ./hosts/Zhulong/home.nix
    #       { nixpkgs.overlays = nixos-overlays; }
    #     ];
    #   };
    # };
  };
}
