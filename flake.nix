# I get it now. Oh my god, I get it now.

{

	description = "A flake that contains configs for both my desktop and laptop.";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
	};

	outputs = { self, nixpkgs, ... }: 
		let
			lib = nixpkgs.lib;
		in {
		nixosConfigurations = {
			# Toaster, my desktop config.
			ARG-Toaster = lib.nixosSystem {
				system = "x86_64-linux";
				modules = [ 
					./hosts/Toaster/configuration.nix
 					./modules/ollama.nix
					./modules/pkgs.nix
					./modules/syncthing.nix
					./modules/gaming.nix
				];
			};
			# Thunkpad, my laptop config.
			ARG-Thunkpad = lib.nixosSystem {
				system = "x86_64-linux";
				modules = [
					./hosts/Thunkpad/configuration.nix
					./modules/ollama.nix
					./modules/pkgs.nix
					./modules/syncthing.nix
				];
			};
		};
	};


}
