{ config, pkgs, ... }:

{
  boot = {
    bootspec.enable = true;
    #kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      systemd-boot.enable = true;
      systemd-boot.editor = true;
      efi.canTouchEfiVariables = true;
    };

    # Quiet boot
    kernelParams = [
      "quiet"
      #"splash"
      #"vga=current"
      #"rd.systemd.show_status=false"
      #"rd.udev.log_level=3"
      "udev.log_level=3"
      #"udev.log_priority=3"
      "systemd.show_status=auto"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
    loader.timeout = 0;

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
