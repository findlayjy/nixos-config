{ config, pkgs, ... }:

{
  # Steam itself
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Allow remoteplay access
    dedicatedServer.openFirewall = false; # Not hosting a game server
  };

  # Performance tweaks on game launch
  programs.gamemode.enable = true;

  # 32-bit graphics support (required by most games via Proton)
  hardware.graphics = {
    enable = true; # Probably not necessary/already set elsewhere
    enable32Bit = true;
  };
}
