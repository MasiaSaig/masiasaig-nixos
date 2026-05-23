{ pkgs, ... }:

{
  programs.thunderbird = {
    enable = true;


    settings = {
      "privacy.donottrackheader.enabled" = true;
    };

    profiles."default" = {
      isDefault = true;
      path = "/home/masiasaig/Programs/.thunderbird/masiasaig.default-release";
    }
  };
}
