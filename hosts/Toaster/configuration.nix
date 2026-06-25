{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "ARG-Toaster";

  system.stateVersion = "25.11";
}
