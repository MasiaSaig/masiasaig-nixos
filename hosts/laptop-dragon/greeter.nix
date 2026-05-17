{ pkgs, lib, ... }:

#let
  #tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  ##session = "${pkgs.hyprland}/bin/Hyprland";
  #session = "hyprland > /dev/null 2>&1";
  #username = "masiasaig";
#in
{
  #services.greetd = {
  #  enable = true;
  #
  #  settings = rec {
  #    initial_session = {
  #      command = "${session}";
  #      user = "${username}";
  #    };
  #    
  #    default_session = {
  #      command = "${tuigreet} --greeting 'Welcome children.' --asterisks --remember --remember-user-session --time --cmd ${session}";
  #      user = "greeter";
  #    };
  #  };
  #};

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        # tuigreet presents the login prompt;
        # on successful auth it launches Hyprland,
        # which triggers noctalia-shell via home-manager
        command = lib.concatStringsSep " " [
          "${pkgs.tuigreet}/bin/tuigreet"
          "--time"                        # show clock
          #"--time-format '%H:%M  %a %d %b'"
          "--remember"                    # remember last user
          "--remember-user-session"       # remember last session per user
          "--asterisks"                   # show * while typing password
          "--greeting 'Welcome children'"
          "--sessions ${pkgs.hyprland}/share/wayland-sessions"
        ];
        user = "greeter";
      };
    };
  };

  # greetd needs to be able to start a Wayland compositor;
  # without this, the TTY seat is not properly handed over
  security.pam.services.greetd.enableGnomeKeyring = false;

  # Required: tuigreet runs before the user session,
  # so XDG_RUNTIME_DIR must exist for Wayland socket creation
  systemd.tmpfiles.rules = [
    "d /run/user/1000 0700 masiasaig users -"
  ];
}
