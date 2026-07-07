# User settings for Plasma, with theme settings

{pkgs, ...}:

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
}
