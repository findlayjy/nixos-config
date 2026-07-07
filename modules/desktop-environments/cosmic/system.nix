# System settings that install and set COSMIC as the DE

{config, pkgs, ...}:

{
  # Enable the COSMIC login manager
  services.displayManager.cosmic-greeter.enable = true;
  # Enable the COSMIC desktop environment
  services.desktopManager.cosmic.enable = true;
  # Enable the system76 scheduler: improves performance?
  services.system76-scheduler.enable = true;
  # Might be useful if non-focussed window needs access to the clipboard?
# environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = "1";

  # Avoid having to rebuild things too often
  nix.settings = {
    substituters = [ "https://cosmic.cachix.org/" ];
    trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
    ];
  };

	# Some COSMIC-specific packages
	environment.systemPackages = with pkgs; [
		cosmic-monitor
	];

}
