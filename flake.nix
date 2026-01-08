# I get it now. Oh my god, I get it now.

{

	description = "A flake that contains configs for both my desktop and laptop. Test to see if Git works or not.";

	inputs = {
		# Unstable branch of Nixpkgs.
		nixpkgs.url = "nixpkgs/nixos-unstable";

		# Hyprland input
		hyprland = {
			url = "github:hyprwm/Hyprland";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		stylix.url = "github:nix-community/stylix";
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
					./modules/pkgs.nix
					./modules/ollama.nix
					./modules/syncthing.nix
					./modules/gaming.nix
					./modules/hyprland.nix
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
