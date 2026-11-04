{ pkgs, lib, ... }:

let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  # hyprland = "${pkgs.hyprland}/bin/Hyprland -q";
  hyprlandStart = "${pkgs.hyprland}/bin/start-hyprland";
  session = "${pkgs.bash}/bin/sh -C 'exec ${hyprlandStart} >/dev/null 2>&1'";
in
{
  services.greetd = {
    enable = true;

    useTextGreeter = true;

    settings = {
      default_session = {
        command = "${tuigreet} --time --remember --asterisks --greeting 'Welcome children' --cmd ${hyprlandStart}";
        # command = ''
        #   ${tuigreet} \
        #   --time \
        #   --remember \
        #   --asterisks \
        #   --greeting "Welcome children" \
        #   --cmd \"${session}\"
        # '';
        user = "greeter";
      };
    };
  };
}