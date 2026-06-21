{ config, pkgs, ... }:

{
  home.username = "jamief";
  home.homeDirectory = "/home/jamief";
  home.stateVersion = "25.11";

  home.file = {
    ".zshrc".source = /home/jamief/.dotfiles/.zshrc;
    ".zshenv".source = /home/jamief/.dotfiles/.zshenv;
    ".zsh".source = /home/jamief/.dotfiles/.zsh;
    ".vimrc".source = /home/jamief/.dotfiles/.vimrc;
    ".latexmkrc".source = /home/jamief/.dotfiles/.latexmkrc;
    ".dir_colors".source = /home/jamief/.dotfiles/.dir_colors;
    ".config/alacritty".source = /home/jamief/.dotfiles/.config/alacritty;
  };

  nixprograms.git = {
    enable = true;
    userName = "Jamie Findlay";
    userEmail = "jy.findlay@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
  };

};

}
