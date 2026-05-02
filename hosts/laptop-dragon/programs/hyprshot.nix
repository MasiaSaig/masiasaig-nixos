{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hyprshot
    grim
    slurp
    wl-clipboard
  ];
}
