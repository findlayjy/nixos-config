# User settings for COSMIC

{config, pkgs, ...}:

{
  home.file.".config/cosmic".source = config.lib.file.mkOutOfStoreSymlink /home/jamief/.dotfiles/.config/cosmic;
}
