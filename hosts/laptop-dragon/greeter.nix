{ pkgs, ... }:

let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  session = "${pkgs.hyprland}/bin/Hyprland";
  username = "masiasaig";
in
{
  services.greetd = {
    enable = true;

    settings = {
      /*initial_session = {
        command = "${session}";
        user = "${username}";
      };*/
      
      default_session = {
        command = "${tuigreet} --greeting 'Welcome children.' --asterisks --remember --remember-user-session --time --cmd ${session}";
        user = "greeter";
      };
    };
  };
}
