{ config, pkgs, ... }:

{

  ## DESKTOP ENVIRONMENT
  imports = [
    # ./desktop-environments/gnome/system.nix # Set Gnome as the DE
    ./desktop-environments/cosmic/system.nix # Set COSMIC as the DE
	  # ./desktop-environments/plasma/system.nix # Set Plasma as the DE
  ];  
  
  # Setting up zsh as the shell
  programs.zsh.enable = true;
  users.users.jamief.shell = pkgs.zsh;

  ## PACKAGES
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # General system packages without dedicated Nix modules
  environment.systemPackages = with pkgs; [
    vim
    emacs-pgtk
    alacritty
    git
    wl-clipboard
    tree
    tldr
    brave
    spotify
    discord
    # nordic
    texliveFull
    # texliveMedium
    ## Python
    python3
    python3Packages.isort
    python3Packages.pytest
    pipenv
    ## Haskell
    haskellPackages.ghc
    haskellPackages.cabal-install
    haskellPackages.hoogle
    haskell-language-server
    ## Doom emacs requirements
    fd
    ripgrep
    pandoc  # for markdown compiling
    shellcheck
    grip
  ];

  # Enable emacs daemon and set as default editor
  services.emacs = {
    enable = true;
    defaultEditor = true;
  };

  # Firefox
  programs.firefox.enable = true;

  # Extensions for Chromium browsers (IDs from Chrome Web Store URL)
  programs.chromium = {
    enable = true;
    extensions = [
      "fdjamakpfbbddfjaooikfcpapjohcfmg" # Dashlane
    ];
  };

  ## FONTS
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono  # JetBrains Mono
	  nerd-fonts.symbols-only
	  fira                       # Fira Sans
	  symbola
	  source-sans
  ];

  ## NETWORKING
  networking.networkmanager.enable = true;

  ## TIMEZONE AND LOCALE
  time.timeZone = "Europe/Oslo";
  i18n.defaultLocale = "en_GB.UTF-8";
  console.keyMap = "uk";

  ## DESKTOP
  services.xserver.enable = true;
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  ## AUDIO
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  ## PRINTING
  services.printing.enable = true;

  ## USER
  users.users.jamief = {
    isNormalUser = true;
    description = "Jamie Findlay";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  ## NIX SETTINGS
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true;
}
