{ config, pkgs, ... }:

{
  networking.hostName = "pc";
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/steam.nix
  ];

  # Boot settings
  boot.loader.grub.enable = false;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 0; # seconds

  # NVidia settings
  services.xserver.videoDrivers = [ "nvidia" ];
  #
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;  # proprietary driver rather than open-source kernel module needed for newer cards
    nvidiaSettings = true; # GUI settings tool
    package = config.boot.kernelPackages.nvidiaPackages.stable; # stable rather than beta/production branch
  };

  # Fixing Bluetooth dongle bug
  systemd.services.bluetooth-reset = {
    description = "Reload btusb to work around ASUS USB-BT500 init bug";
    after = [ "bluetooth.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 5";
      ExecStart = [
        "${pkgs.kmod}/bin/modprobe -r btusb"
        "${pkgs.kmod}/bin/modprobe btusb"
      ];
    };
  };

  system.stateVersion = "26.05";
}
