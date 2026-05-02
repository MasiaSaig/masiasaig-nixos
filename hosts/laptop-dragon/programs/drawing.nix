{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    drawing
  ];
}
