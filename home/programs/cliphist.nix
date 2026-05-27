{ pkgs, ... }:

{
  services.cliphist = {
    enable = true;
    allowImages = true; # allowes storing images in clipboard
  };
}