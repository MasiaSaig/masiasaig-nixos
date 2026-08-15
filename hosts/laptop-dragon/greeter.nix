{ pkgs, lib, ... }:

let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  hyprlandStart = "${pkgs.hyprland}/bin/start-hyprland";
in
{
  services.greetd = {
    enable = true;
    settings = {

      default_session = {
        command = ''
          ${tuigreet} \
          --time \
          --remember \
          --asterisks \
          --greeting "Welcome children" \
          --cmd "${pkgs.bash}/bin/sh -c 'exec ${hyprlandStart} >/dev/null 2>&1'"
        '';
        user = "greeter";
      };
    };
  };
}