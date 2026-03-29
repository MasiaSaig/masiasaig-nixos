{ pkgs, ... }:

{
  home.packages = [ pkgs.hyprlauncher ];

  # xdg.configFile."hypr/hyprlauncher/toml".source = ./hyprlauncher.toml;
}