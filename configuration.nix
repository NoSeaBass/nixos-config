# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running 'nixos-help').

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ./modules/core.nix
      ./modules/users.nix
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

      # Limit system generations to free up /nix
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 30d";

  # Limit GRUB/systemd-boot kernels to prevent /boot from filling up
  boot.loader.systemd-boot.configurationLimit = 10;
  # OR if using grub:
  # boot.loader.grub.configurationLimit = 10;


    system.stateVersion = "25.11"; # Did you read the comment?

}
