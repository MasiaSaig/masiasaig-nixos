{ ... }:

{
  programs.waybar = {
    enable = true;
  };

  xdg.configFile."waybar/config.jsonc".source = ./config.jsonc;
  xdg.configFile."waybar/style.css".source = ./style.css;
  xdg.configFile."waybar/hardware.json".source = ./hardware.json;
  xdg.configFile."waybar/media.json".source = ./media.json;
  xdg.configFile."waybar/modules.json".source = ./modules.json;
}
