# User settings for Plasma, with theme settings

{pkgs, ...}:

{

	home.packages = with pkgs; [
		nordic
		nordzy-cursor-theme
		papirus-icon-theme
	];

	# Declarative KDE control via plasma-manager
	programs.plasma = {
    	enable = true;
    
	    workspace = {
	      lookAndFeel = "Nordic";
	      colorScheme = "Nordic";
	      theme = "Nordic";
	    };
	  }; 
# GTK
 # gtk = {
  #  enable = true;
   # theme = {
    #  name = "Nordic";
     # package = pkgs.nordic;
#    };
 # gtk4.theme = null; # Adopt new default behaviour
  #};
}
