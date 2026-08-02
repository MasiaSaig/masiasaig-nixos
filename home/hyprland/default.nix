{ config, pkgs, ... }:

{
  imports = [
    ./input.nix
    ./binds.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";

    settings = {
      monitor = [
        "eDP-1, preferred, auto, 1"
        "HDMI-A-1, preferred, auto-right, 1"
      ];
      
      general = {
        gaps_out = 8;
        resize_on_border = true;
      };

      misc = {
        force_default_wallpaper = 0;
	      disable_hyprland_logo = true;
      };

      ecosystem = {
        no_donation_nag = true;
	      no_update_news = false;
      };

      # Auto-start
      exec-once = [
        "noctalia"
        "sleep 2 & discord"
      ];
    };
  };
}