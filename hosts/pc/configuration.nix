{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
  ];

  # Boot settings
  # Here, use systemd-boot to pick a disk from the BIOS boot menu, since Pop!_OS is installed on a different drive. Could remove and switch to grub once I'm single booting.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 3; # seconds

  networking.hostName = "pc";

  system.stateVersion = "26.05";
}
