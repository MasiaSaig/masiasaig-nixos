{ config, pkgs, ... }:

{
  # List pakages installed in system profile. Search with:
  # >> nux search wget
  environment.systemPackages = with pkgs; [
    #wget
    unzip
    git
    htop
    brightnessctl
    #swaynotificationcenter    # Notification daemon (swaync)

    docker-buildx
  ];

  environment.sessionVariables = {
    # Hint Electron apps use Wayland
    NIXOS_OZONE_WL = "1";
    # For firefox on Wayland
    MOZ_ENABLE_WAYLAND = "1";
  };

  security.polkit.enable = true;
}
