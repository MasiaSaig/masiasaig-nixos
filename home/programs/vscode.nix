{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        vue.volar
        eamodio.gitlens
        github.copilot
        github.copilot-chat
      ];

      /*userSettings = {
        # General editor settings
        "editor.fontFamily" = "'Fira Code'";
        "editor.fontSize" = 14;
      }*/
    };
  };
}
