{ pkgs, ... }:

# Dependencies for Noctalia plugin called "Screen Toolkit"

{ 
  environment.systemPackages = with pkgs; [
    grim slurp hyprpicker wl-clipboard imagemagick zbar curl
    translate-shell wl-screenrec ffmpeg gifski jq
    python3 python3Packages.pygobject3 xdg-desktop-portal

    tesseract
  ];
  nixpkgs.config.tesseractLanguages = [ "eng" "pol" ];
}