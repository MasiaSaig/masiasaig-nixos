{ config, pkgs, ... }:

{
  # Needed for screen-sharing (see Hyprland page)
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;

    # Disable X11 bell module, which plays a sound on urgency hint
    # (my prompt includes an urgency hint, so I want no sounds).
    /*extraConfig = {
      pipewire."99-silent-bell.conf" = {
        "context.properties" = {
          "module.x11.bell" = false;
        };
      };
    };*/
  };

  # Needed for screen-sharing
  xdg.portal = {
    enable = true;
    # Add gtk here as it's needed for file pickers/portals
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };
}
