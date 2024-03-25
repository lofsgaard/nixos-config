{ config,lib, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "fjs";
  home.homeDirectory = "/home/fjs";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
   # pkgs.vim
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # '';
    ".config/i3/config".source = ./i3.config;
  };

  # Program configs
  programs.alacritty = {
    enable = true;
    settings = lib.attrsets.recursiveUpdate (import ~/nixos-config/alacritty/default-settings.nix) {};
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    shellAliases = {
      ls = "lsd";
      ll = "lsd -l";
      pydev = "nix-shell -p python3 pipenv";
    };
    
    oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [ "git" ];
    };
  };
  programs.git = {
    enable = true;
    userName = "Andreas Løfsgaard";
    userEmail = "andreas@lofsgard.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  
  # Home Manager can also manage your environment variables
  home.sessionVariables = {
     EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
