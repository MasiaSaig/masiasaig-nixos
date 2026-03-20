{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "MasiaSaig";
        email = "mullermaciej12@gmail.com";
      };
    };
  };
}
