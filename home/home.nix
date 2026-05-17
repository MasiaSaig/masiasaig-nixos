{ config, pkgs, inputs, ... }:

{
  # Imports modules, which should be able to switch ON/OFF
  imports = [
    inputs.noctalia.homeModules.default
    ./hyprland/default.nix
    
    #./programs/waybar/default.nix
    #./programs/wlogout/default.nix
    #./programs/hypridle/default.nix
    #./programs/hyprlauncher/default.nix
    #./programs/hyprpicker/default.nix
    ./programs/vscode/default.nix

    ./programs/discord.nix
    #./programs/hyprpaper.nix
    ./programs/hyprshot.nix
    ./programs/kitty.nix
    ./programs/git.nix
    ./programs/neovim.nix
    #./programs/pavucontrol.nix
    ./programs/hyprsunset.nix
    ./programs/bash.nix
  ];
  programs.noctalia-shell = {
    enable = true;
  };

  # Home Manager's information of user.
  home.username = "masiasaig";
  home.homeDirectory = "/home/masiasaig";


  #########################################################################

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
