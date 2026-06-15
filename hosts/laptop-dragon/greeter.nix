{ pkgs, lib, ... }:

let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  hyprland = "${pkgs.hyprland}/bin/Hyprland";
  hyprlandSession = "${pkgs.hyprland}/share/wayland-sessions";
  ##session = "${pkgs.hyprland}/bin/Hyprland";
  # session = "hyprland > /dev/null 2>&1";
  # username = "masiasaig";
in
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
      # initial_session = {
      #   command = "${session}";
      #   user = "${username}";
      # };

      default_session = {
        # tuigreet presents the login prompt;
        # on successful auth it launches Hyprland,
        # which triggers noctalia-shell via home-manager
        # command = "${tuigreet} --greeting 'Welcome children.' --asterisks --remember --remember-user-session --time --cmd ${session}";
        command = lib.concatStringsSep " " [
          "${tuigreet}"
          "--time"                        # show clock
          #"--time-format '%H:%M  %a %d %b'"
          "--remember"                    # remember last user
          "--remember-user-session"       # remember last session per user
          "--asterisks"                   # show * while typing password
          "--greeting 'Welcome children.'"
          "--sessions ${hyprlandSession}"
          # "--session-wrapper '${pkgs.bash}/bin/bash -c \"$@ >/dev/null 2>&1\" --'"
          # "--cmd 'hyprland > /dev/null 2>&1'"
        ];
        user = "greeter";
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  # greetd needs to be able to start a Wayland compositor;
  # without this, the TTY seat is not properly handed over
  # security.pam.services.greetd.enableGnomeKeyring = false;

  # Required: tuigreet runs before the user session,
  # so XDG_RUNTIME_DIR must exist for Wayland socket creation
  # systemd.tmpfiles.rules = [
  #   "d /run/user/1000 0700 masiasaig users -"
  # ];
}
