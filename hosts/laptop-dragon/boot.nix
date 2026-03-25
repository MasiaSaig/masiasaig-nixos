{ config, pkgs, ... }:

{
  boot = {
    bootspec.enable = true;
    #kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      systemd-boot = {
        enable = true;
        editor = true;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
    };

    # Quiet boot
    kernelParams = [
      #"i915"          # hopefully prevents screen tearing
      
      "quiet"
      "loglevel=3"                    # kernel log lever
      "rd.udev.log_level=3"           # udev log level in initrd
      "rd.systemd.show_status=false"  # initrd systemd status
      "splash"                        # required by Plymouth to surpass console
      "vt.global_cursor_default=0"    # hide blinking cursor
      "udev.log_level=3"
      "systemd.show_status=false"
    ];
    consoleLogLevel = 0;
    loader.timeout = 0;
    initrd = {
      verbose = false;
      systemd.enable = true;      # initrd systemd for cleaner handoff to Plymouth
    };

    # Boot animation
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        # By default, we would install all animations
	(adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };
  };
}
