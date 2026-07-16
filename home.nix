{ config, pkgs, ... }:

{
  imports = [
#    ./modules/desktop-environments/gnome/home.nix # User settings for Gnome
#    ./modules/desktop-environments/plasma/home.nix # User settings for Plasma
   ./modules/desktop-environments/cosmic/home.nix # Enable when COSMIC is configured the way I like
  ];
  
  ## BASIC SETTINGS
  home.username = "jamief";
  home.homeDirectory = "/home/jamief";

  ## SYMLINKING DOTFILES
  home.file = {
    ".zshrc".source = config.lib.file.mkOutOfStoreSymlink /home/jamief/.dotfiles/.zshrc;
    ".zshenv".source = config.lib.file.mkOutOfStoreSymlink /home/jamief/.dotfiles/.zshenv;
    ".zsh".source = config.lib.file.mkOutOfStoreSymlink /home/jamief/.dotfiles/.zsh;
    ".vimrc".source = config.lib.file.mkOutOfStoreSymlink /home/jamief/.dotfiles/.vimrc;
    ".latexmkrc".source = config.lib.file.mkOutOfStoreSymlink /home/jamief/.dotfiles/.latexmkrc;
    ".dir_colors".source = config.lib.file.mkOutOfStoreSymlink /home/jamief/.dotfiles/.dir_colors;
    ".config/alacritty".source = config.lib.file.mkOutOfStoreSymlink /home/jamief/.dotfiles/.config/alacritty;
  };

  # Setting some default applications
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "brave-browser.desktop";
      "x-scheme-handler/http" = "brave-browser.desktop";
      "x-scheme-handler/https" = "brave-browser.desktop";
      "x-scheme-handler/chrome" = "brave-browser.desktop";
      "application/x-extension-htm" = "brave-browser.desktop";
      "application/x-extension-html" = "brave-browser.desktop";
      "application/x-extension-shtml" = "brave-browser.desktop";
      "application/xhtml+xml" = "brave-browser.desktop";
      "application/x-extension-xhtml" = "brave-browser.desktop";
      "application/x-extension-xht" = "brave-browser.desktop";
      "x-scheme-handler/about" = "brave-browser.desktop";
    };
  };

  ## USER PACKAGES
  # ...
 
  # Git settings
  programs.git = {
    enable = true;
    settings = {
      user.name = "Jamie Findlay";
      user.email = "jy.findlay@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

}
