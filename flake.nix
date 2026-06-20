{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	home-manager = {
    	url = "github:nix-community/home-manager";
	    inputs.nixpkgs.follows = "nixpkgs";
    	};
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations = {
      vm = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/vm/configuration.nix ];
      };
    };
  };
}
