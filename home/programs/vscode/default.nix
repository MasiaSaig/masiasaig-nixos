{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        /*
        vue.volar                           # Vue intelisense
        eamodio.gitlens                     # Git-lens
        github.copilot                      # Github Copilot
        github.copilot-chat
        bmewburn.vscode-intelephense-client # PHP-intelisense
        */
      ];

      /*userSettings = {
        # General editor settings
        "editor.fontFamily" = "'Fira Code'";
        "editor.fontSize" = 14;
      }*/
    };
  };
}
