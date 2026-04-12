{ config, pkgs, ... }:

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

  # List pakages installed in system profile. Search with:
  # >> nux search wget
  environment.systemPackages = with pkgs; [
    # Tools
    unzip
    #wget
    git
    htop
    
    # Screen locker
    hyprlock
    
    # Needed for dolphin's svg icons support
    kdePackages.qtsvg
    kdePackages.dolphin

    # Screen-shot
    hyprshot
    grim
    slurp
    wl-clipboard

    # Brightness change
    brightnessctl

    # Notification daemon (swaync)
    swaynotificationcenter
  ];

  environment.sessionVariables = {
    # Hint Electron apps use Wayland
    NIXOS_OZONE_WL = "1";
    # For firefox on Wayland
    MOZ_ENABLE_WAYLAND = "1";
  };
}
