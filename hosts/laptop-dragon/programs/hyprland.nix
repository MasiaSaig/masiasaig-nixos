{ pkgs, ... }:

{
  # Some programs need SUID wrappers, can be configured further or are started in user sessions.
  programs = {
    hyprland = {
      enable = true;
      # Set flake package and portal package to be in sync
      #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      #portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      # Enable UWSM (recommended)
      withUWSM = true;
      # Compatibility layer allows X11 application to run on Wayland compositor, ensures legacy apps to function in modern Wayland environment.
      xwayland.enable = true;
    };
  };
}
