{ pkgs, ... }:

let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  #session = "${pkgs.hyprland}/bin/Hyprland";
  session = "hyprland > /dev/null 2>&1";
  username = "masiasaig";
in
{
  services.greetd = {
    enable = true;

    settings = rec {
      initial_session = {
        command = "${session}";
        user = "${username}";
      };
      default_session = initial_session;
      
      /*default_session = {
        command = "${tuigreet} --greeting 'Welcome children.' --asterisks --remember --remember-user-session --time --cmd ${session}";
        user = "greeter";
      };*/
    };
  };
}
