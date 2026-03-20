{ config, pkgs, ... }:

{
  # Swap /home/masiasaig/hypr/hyprland.conf with ./hyprland.conf
  #home.file."/home/masiasaig/hypr/hyprland.conf".source = ./hyprland.conf;

  imports = [
    ./input.nix
    ./programs.nix
    ./decoration.nix
    ./animation.nix
    ./binds.nix
    ./windowrule.nix
    ./env.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    # conflicts with UWSM (Universal Wayland Session Manager)
    systemd.enable = false;

    settings = {
      monitor = ",preferred,auto,auto";
      
      general = {
        gaps_in = 4;
	gaps_out = 20;
	border_size = 2;
	resize_on_border = true;
	"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
	"col.inactive_border" = "rgba(595959aa)";
	allow_tearing = false;
	layout = "dwindle";
      };

      dwindle = {
        pseudotile = true;
	preserve_split = true;
	force_split = 2;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = 0;
	disable_hyprland_logo = true;
      };

      ecosystem = {
        no_donation_nag = true;
	no_update_news = false;
      };
    };
  };
}
