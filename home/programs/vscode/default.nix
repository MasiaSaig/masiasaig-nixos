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
        # Custom CSS and JS loader
        */
      ];

      userSettings = {
        "editor.tabSize" = "2";
        "editor.insertSpaces" = true;
        "editor.detectIndentation" = false;

        # Sets different font for comments
        "vscode_custom_css.imports" = [
          "file:///home/masiasaig/.vscode/vs-code-styles.css"
        ];
        "vscode_custom_css.policy" = true;
        "editor.tokenColorCustomizations" = {
          "textMateRules" = [
            {
              "scope" = "comment";
              "settings" = {
                "fontStyle" = "italic";
              };
            }
          ];
        };
        "terminal.integrated.defaultProfile.linux" = "bash";
        #"terminal.integrated.fontFamily" = "FiraCode Nerd Font";
      };
    };
  };

  # File with custom CSS
  # Sets different font for comments
  # Need to install "Custom CSS and JS loader" extension
  home.file.".vscode/vs-code-styles.css".source = ./vs-code-style.css;
}
