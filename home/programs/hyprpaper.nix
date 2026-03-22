{ ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/Pictures/wallpapers/0.webp"
      ];
      wallpaper = [
        # By display
        #"DP-2,~/wallpapers/wallpaper2.jpg"
        # By default/fallback
        ",~/Pictures/wallpapers/0.webp"
      ];
    };
  };
}
