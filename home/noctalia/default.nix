{ pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    
    settings = {
      widget.clock = {
        type   = "clock";
        format = "{:%d.%m.%Y %H:%M}";
      };

      shell.screenshot = {
        directory = "~/Pictures/screenshots";
        filename_pattern = "%d-%m-%Y_%H-%M-%S.png";  # optional, leave as-is if you like the default
        copy_to_clipboard = true;
      };

      location = {
        # needed for night light and callendar events
        auto_locate = true;
        # address = "Kraków, Poland";  # alternative to lat/lon if not auto-locating
        # latitude = 49.9909;
        # longitude = 20.6206;

        custom_schedule = true;
        sunset = "21:00";
        sunrise = "07:00";
      };

      nightlight = {
        enabled = true;
        temperature_day = 6500;
        temperature_night = 4000;
      };

      shell = {
        launcher = {
          sort_by_usage = true;
          show_icons = true;
          compact = false;
          app_grid = true;
          fetch_exchange_rates = true;
        };

        panel = {
          launcher_placement = "attached";
          launcher_position = "center";
        };
      };

      wallpaper = {
        transition_on_startup = true;
      };

      bar.default = {
        start  = [ "launcher" "wallpaper" "workspaces" "tray" "media" ];
        center = [ "kenn/keybind-cheatsheet:keybinds" "clock" "noctalia/notes" ];
        end    = [ "notifications" "clipboard" "network" "brightness" "volume" "battery" "session" ];
      };

      plugins = {
        enabled = [
          "noctalia/notes"
          "noctalia/screen_recorder"
          "oldirtty/color_picker"
          "kenn/keybind-cheatsheet"
        ];
        source = [
          {
            auto_update = true;
            kind = "git";
            location = "https://github.com/noctalia-dev/official-plugins";
            name = "official";
          }
          {
            auto_update = true;
            kind = "git";
            location = "https://github.com/noctalia-dev/community-plugins";
            name = "community";
          }
        ];
      };
    };
  }; 
}