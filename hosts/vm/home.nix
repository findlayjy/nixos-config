{ config, pkgs, ... }:

{
  home.file.".config/autostart/spice-vdagent.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=SPICE vdagent
    Exec=spice-vdagent
    NoDisplay=true
  '';
}
