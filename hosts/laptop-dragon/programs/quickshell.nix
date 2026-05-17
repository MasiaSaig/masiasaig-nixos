{ pkgs, inputs, ... }:

{
  environment.systemPackages = [
    inputs.quickshell.packages.${pkgs.system}.quickshell
  ];
}