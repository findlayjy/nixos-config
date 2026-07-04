# System settings that install and set Gnome as the DE

{config, pkgs, ...}:
{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  programs.dconf.enable = true;
}