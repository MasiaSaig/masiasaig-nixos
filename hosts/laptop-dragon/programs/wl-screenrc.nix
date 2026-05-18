{ pkgs, ... }:

# For recording screen

{
  environment.systemPackages = with pkgs; [
    slurp
    wl-screenrec
  ];
}