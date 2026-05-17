{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hypridle
  ];

  services.hypridle = {
    enable = true;
  };

  xdg.configFile."hypr/hypridle.conf".source = ./hypridle.conf;
}