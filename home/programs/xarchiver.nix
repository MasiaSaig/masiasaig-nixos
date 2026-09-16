{ pkgs, ... }:

{
  home.packages = with pkgs; [
    xarchiver
    unzip
    zip
    p7zip
    unrar
  ];
}
