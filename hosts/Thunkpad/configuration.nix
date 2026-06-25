{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "ARG-Thunkpad";

  system.stateVersion = "25.11";
}
