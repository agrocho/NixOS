{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    btop-rocm
    lact
    libreoffice
    obsidian
    mediawriter
    ncdu
    winbox
    discord
    fastfetch
  ];
}
