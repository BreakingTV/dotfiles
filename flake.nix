{
  description = "Semiko NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:the-argus/spicetify-nix";
    home-manager.url = "github:nix-community/home-manager";

    aagl.url = "github:ezKEa/aagl-gtk-on-nix/release-24.05";
    aagl.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, home-manager, aagl, ... } @ inputs: {

        nixosConfigurations.nixos-laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [

          ./hosts/nixos-laptop

          # User import
          ./users/semiko
          ./users/workaholic

          home-manager.nixosModules.home-manager
            {
              home-manager.backupFileExtension = "backup";
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs;
              home-manager.users.semiko = import ./users/semiko/home.nix;
              home-manager.users.workaholic = import ./users/workaholic/home.nix;
            }
          ];
        };

        nixosConfigurations.nixos-tower = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nixos-tower

          # User import
          ./users/semiko
          ./users/oksana
          home-manager.nixosModules.home-manager
            {
	          home-manager.backupFileExtension = "backup";
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs;
              home-manager.users.semiko = import ./users/semiko/home.nix;
              home-manager.users.oksana = import ./users/oksana/home.nix;
            }
          ];
        };

        nixosConfigurations.nixos-server = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nixos-server

          # User import
          ./users/server
          home-manager.nixosModules.home-manager
            {
	          home-manager.backupFileExtension = "backup";
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs;
              home-manager.users.server = import ./users/server/home.nix;
            }
          ];
        };
 
  };
}
