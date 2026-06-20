{ config, pkgs, ... }:

{
  home.username = jamief;
  home.homeDirectory = /home/jamief;
  home.stateVersion = 25.11;

  home.file = {
    ".zshrc".source = ./dotfiles/.zshrc;
    ".zshenv".source = ./dotfiles/.zshenv;
    ".zsh".source = ./dotfiles/.zsh;
    ".vimrc".source = ./dotfiles/.vimrc;
    ".latexmkrc".source = ./dotfiles/.latexmkrc;
    ".dir_colors".source = ./dotfiles/.dir_colors;
    ".config/alacritty".source = ./dotfiles/.config/alacritty;
  };
}
