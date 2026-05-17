
{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = ''
      set clipboard=unnamedplus
    '';

    withRuby = false;
    withPython3 = false;
  };
}

