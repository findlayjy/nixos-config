{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.configurationLimit = 5; 
  boot.loader.timeout = 0; # don't show the menu on boot

  networking.hostName = "vm";

  # SPICE clipboard (VM-specific)
  services.spice-vdagentd.enable = true;
  systemd.user.services.spice-vdagent = {
    description = "SPICE vdagent";
    wantedBy = [ "default.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.spice-vdagent}/bin/spice-vdagent";
      Restart = "on-failure";
    };
  };

  # No suspend in VM
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowSuspendThenHibernate=no
    AllowHybridSleep=no
  '';

  system.stateVersion = "25.11";
}
