{ pkgs, ... }:

let
  wallpaper = "~/Pictures/wallpapers/0.webp";
in
{
  #####################
  # Wallpaper 'manager'
  #####################

  home.packages = [ pkgs.hyprpaper ];
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        wallpaper
      ];
      wallpaper = [
        # By display
        #"DP-2,~/wallpapers/wallpaper2.jpg"
        
        # By default/fallback
        ", ${wallpaper}"

        # New since 26.05
        /*{
          monitor = "";
          path = ", /home/masiasaig/Pictures/wallpaper/0.webp";
        }*/
      ];
    };
  };
}
