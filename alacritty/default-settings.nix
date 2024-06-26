# ~/nix-config/alacritty/default-settings.nix

{
  env = {
    "TERM" = "xterm-256color";
  };

  font = {
    size = 12.0;
  };

  cursor.style = "Beam";


  colors = {
    # Default colors
    primary = {
      background = "#1E1E2E";
      foreground = "#CDD6F4";
    };

    # Normal colors
    normal = {
      black =   "#45475A";
      red =     "#F38BA8";
      green =   "#A6E3A1";
      yellow =  "#F9E2AF";
      blue =    "#89B4FA";
      magenta = "#F5C2E7";
      cyan =    "#94E2D5";
      white =   "#BAC2DE";
    };

    # Bright colors
    bright = {
      black =   "#585B70";
      red =     "#F38BA8";
      green =   "#A6E3A1";
      yellow =  "#F9E2AF";
      blue =    "#89B4FA";
      magenta = "#F5C2E7";
      cyan =    "#94E2D5";
      white =   "#A6ADC8";
    };
  };
}
