{ pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;

    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        screen-toolkit = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        clipboard = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        # screen-recorder = {
        #   enabled = true;
        #   sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        # };
      };

      version = 2;
    };

    # TODO: check how to change settings for plugins ._.
    # pluginSettings = {
    #   catwalk = {
    #     minimumThreshold = 25;
    #     hideBackground = true;
    #   };
    #   # this may also be a string or a path to a JSON file.
    # };
  }; 
}