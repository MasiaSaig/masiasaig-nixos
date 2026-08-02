{ pkgs, ... }:

{
  programs.starship = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    starship
  ];
}
