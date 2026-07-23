{ config, pkgs, ... }:

{
  networking.hostName = "pc";
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/steam.nix
  ];

  # Boot settings
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    devices = [ "nodev" ];  # UEFI install, not writing to an MBR
    useOSProber = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 3; # seconds

  # NVidia settings
  services.xserver.videoDrivers = [ "nvidia" ];
  #
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;  # proprietary driver rather than open-source kernel module needed for newer cards
    nvidiaSettings = true; # GUI settings tool
    package = config.boot.kernelPackages.nvidiaPackages.stable; # stable rather than beta/production branch
  };

  system.stateVersion = "26.05";
}
