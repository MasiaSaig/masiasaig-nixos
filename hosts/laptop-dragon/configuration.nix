# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./boot.nix
      ./nvidia.nix
      ./pipewire.nix
      ./fonts.nix
      ./programs.nix
      ./tlp.nix
      ./greeter.nix
      ./docker.nix

      ./programs/hyprland.nix
      ./programs/firefox.nix
      ./programs/git.nix
      ./programs/neovim.nix
      ./programs/starship.nix
      ./programs/drawing.nix
      ./programs/dbeaver.nix
      ./programs/thunar.nix
      ./programs/quickshell.nix
      ./programs/qbittorrent.nix
      ./programs/vlc.nix
      ./programs/noctalia-plugins/screen-toolkit.nix
      ./programs/noctalia-plugins/clipboard.nix
      ./programs/chrome.nix

      # ./programs/gpu-screen-recorder.nix
      #./programs/hyprshot.nix
      #./programs/hyprlock.nix
      #./programs/wl-screenrc.nix
    ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.dbus.packages = with pkgs; [ dconf ];
  # Services for Noctalia (enables wifi, bluetooth, power-profile, battery feature)
  hardware.bluetooth.enable = true;
  # services.power-profiles-daemon.enable = true;   # CONFLIC with tlp
  services.upower.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.masiasaig = {
    isNormalUser = true;
    description = "Masia Saig";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Set default editor to vim
  environment.variables.EDITOR = "nvim";

  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 16*1024; # 16 GiB
  }];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
