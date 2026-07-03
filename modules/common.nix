{ config, pkgs, ... }:

{
  # Setting up zsh as the shell
  programs.zsh.enable = true;
  users.users.jamief.shell = pkgs.zsh;

  ## PACKAGES
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # Firefox
  programs.firefox.enable = true;
  # Brave (browser)
#  programs.brave.enable = true;
  # Extensions for Chromium browsers (IDs from Chrome Web Store URL)
  programs.chromium = {
    enable = true;
    extensions = [
      "fdjamakpfbbddfjaooikfcpapjohcfmg" # Dashlane
    ];
  };

  # Misc dev tools (probably should move most of these to their own lines)
  environment.systemPackages = with pkgs; [
    vim
    alacritty
    git
    ripgrep
    wl-clipboard
	tree
	brave
  ];

  ## FONTS
  # JetBrains mono
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  ## NETWORKING
  networking.networkmanager.enable = true;

  ## TIMEZONE AND LOCALE
  time.timeZone = "Europe/Oslo";
  i18n.defaultLocale = "en_GB.UTF-8";
  console.keyMap = "uk";

  ## DESKTOP
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
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
