# Gaming-related packages and services.
{ config, pkgs, ...}:

{

	environment.systemPackages = with pkgs;  [
		protonup-qt
	];


	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
	};	

	programs.gamemode.enable = true;
}
