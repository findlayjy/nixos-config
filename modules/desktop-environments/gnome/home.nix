# User settings for Gnome, with some dconf and theme settings

{config, pkgs, ...}:

{
# GTK
  gtk = {
    enable = true;
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
  gtk4.theme = null; # Adopt new default behaviour
  };

  # Gnome settings
  dconf.settings = {
	# Bring back minimize, maximise, close buttons
	"org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };
	# Setting global dark mode
	"org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
	# Enable the shell-theme extension
    "org/gnome/shell" = {
	  disable-user-extensions = false;
      enabled-extensions = [ "user-theme@gnome-shell-extensions.gcampax.github.com" ];
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = "Nordic";
    };
  };
}