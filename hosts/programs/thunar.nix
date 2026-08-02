{ pkgs, ... }:

{
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-volman
    ];
  };

  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };

  environment.systemPackages = with pkgs; [
    nautilus-open-any-terminal

    papirus-icon-theme
    adwaita-icon-theme
  ];

  # Enable the XDG terminal execution spec
  xdg.terminal-exec.enable = true;
  xdg.terminal-exec.settings.default = [ "kitty.desktop" ];
}
