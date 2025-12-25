# This file contains settings for Syncthing.

{ config, pkgs, ...}:

{

environment.systemPackages = [ pkgs.syncthing ];

# Syncthing Configuration
	services.syncthing = {
		dataDir = "/home/agro";
		enable = true;
		user = "agro";

	};
}
