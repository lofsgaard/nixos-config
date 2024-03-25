# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "asgard"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nb_NO.UTF-8";
    LC_IDENTIFICATION = "nb_NO.UTF-8";
    LC_MEASUREMENT = "nb_NO.UTF-8";
    LC_MONETARY = "nb_NO.UTF-8";
    LC_NAME = "nb_NO.UTF-8";
    LC_NUMERIC = "nb_NO.UTF-8";
    LC_PAPER = "nb_NO.UTF-8";
    LC_TELEPHONE = "nb_NO.UTF-8";
    LC_TIME = "nb_NO.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "no";
    xkb.variant = "";
  };
  

  # Set video driver for xserver
  services.xserver.videoDrivers = ["nvidia"];


  # Configure console keymap
  console.keyMap = "no";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fjs = {
    isNormalUser = true;
    description = "fjs";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  
  # Grant trusted user to @wheel group
  nix.settings.allowed-users = [
    "@wheel"
  ];
  # Configures default shell  
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;  
  
  # Configures file manager
  programs.thunar.enable = true;
  services.tumbler.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  # Enables i3 window manager and xserver
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };
   
    displayManager = {
        defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3status # gives you the default i3 status bar
        i3lock #default i3 screen locker
        rofi
        autotiling    
        lxappearance
        polybar
     ];
    };
  };
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  programs.dconf.enable = true;

  # Enable PipeWire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  # If you want to use JACK applications, uncomment this
  #jack.enable = true;
  };

  # Installing fonts
  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
    nerdfonts
  ];

  programs.steam = {
    enable = true;
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    firefox
    alacritty
    git
    pavucontrol
    discord
    spotify
    vscode
    neovim
    go
    neofetch
    flameshot
    pipenv
    lsd
    pamixer
    gcc
    cargo
    devenv
    steam
    btop
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
