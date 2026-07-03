{ config, pkgs, ... }:

{
  # Enable Spice vdagent so clipboard works both ways
  home.file.".config/autostart/spice-vdagent.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=SPICE vdagent
    Exec=spice-vdagent
    NoDisplay=true
  '';
}
