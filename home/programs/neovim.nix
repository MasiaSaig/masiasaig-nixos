
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
      set clipboard=unnamedplus
    '';
  };
}

