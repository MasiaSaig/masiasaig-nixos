{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    # Workaround for nixpkgs #573021 VS code Copilot extension not 
    # working due to missing executable permission on copilot-runtime
    package = pkgs.vscode.overrideAttrs (old: {
      postFixup = (old.postFixup or "") + ''
        find "$out/lib/vscode/resources/app" \
          -type f -name copilot-runtime -exec chmod +x {} +
      '';
    });

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        github.copilot
        github.copilot-chat
      ];

      userSettings = {
        "editor.fontFamily" = "Fira Code";
        "editor.fontLigatures" = true;
        "editor.tabSize" = 2;
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
        "gitlens.ai.model" = "gemini:gemini-3-flash-preview";
        #"terminal.integrated.fontFamily" = "FiraCode Nerd Font";
      };
    };
  };

  # File with custom CSS
  # Sets different font for comments
  # Need to install "Custom CSS and JS loader" extension
  home.file.".vscode/vs-code-styles.css".source = ./vs-code-style.css;
}
