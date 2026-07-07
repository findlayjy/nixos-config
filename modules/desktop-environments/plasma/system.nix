# System settings that install and set KDE Plasma as the DE
{pkgs, ...}:

{
  # Enable Plasma
  services.desktopManager.plasma6.enable = true;
  # Default display manager for Plasma (a fork of SSDM)
  displayManager.plasma-login-manager.enable = true;

  # Optional but recommended for Plasma integration:
  # Enable dconf so GTK application settings persist nicely under Plasma
  # programs.dconf.enable = true;

  # Exclude some default KDE applications
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa       # Music player
    kate        # Text editor
    # khelpcenter # Help center
  ];

  # Some packages only wanted when running Plasma
  environment.systemPackages = with pkgs; [
    kdePackages.spectacle
    kdePackages.ark
  ];

}
