{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      vue.volar
      eamodio.gitlens
      github.copilot
      github.copilot-chat
    ];
  };
}
