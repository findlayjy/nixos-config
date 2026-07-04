{ config, pkgs, ... }:

{

  ## DESKTOP ENVIRONMENT
  import = [
#    ./desktop-environments/gnome/system.nix # Set Gnome as the DE  
    ./desktop-environments/cosmic/system.nix # Set COSMIC as the DE
  ];  
  
  # Setting up zsh as the shell
  programs.zsh.enable = true;
  users.users.jamief.shell = pkgs.zsh;

  ## PACKAGES
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Firefox
  programs.firefox.enable = true;

  # Extensions for Chromium browsers (IDs from Chrome Web Store URL)
  programs.chromium = {
    enable = true;
    extensions = [
      "fdjamakpfbbddfjaooikfcpapjohcfmg" # Dashlane
    ];
  };

  # Other packages without dedicated Nix modules (some do and should be moved up)
  environment.systemPackages = with pkgs; [
    vim
    alacritty
    git
    ripgrep
    wl-clipboard
	tree
	brave
#	gnome-tweaks
	nordic
  ];

  ## FONTS
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono  # JetBrains Mono
	fira                       # Fira Sans
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
