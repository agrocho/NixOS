# A general list of packages that don't have associated settings.
{ config, pkgs, ... }:

{

environment.systemPackages = with pkgs; [
# Utility
	btop-rocm
#	protonup-qt
	lact
	libreoffice
	obsidian
	mediawriter
	ncdu
	winbox
# Fun
	discord
	fastfetch
];

}
