{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    #nerdfonts
    font-awesome
    #inter
    nerd-fonts.ubuntu
  ];
}
