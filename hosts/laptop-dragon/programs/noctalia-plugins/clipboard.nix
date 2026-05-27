{ pkgs, ... }:

# For: https://noctalia.dev/plugins/clipboard

{
  environment.systemPackages = with pkgs; [
    wl-clipboard
    cliphist
  ];
}
