{ ... }:

{
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DontCheckDefaultBrowser = true;
    };
  };

  environment.sessionVariables = {
    # For firefox on Wayland
    MOZ_ENABLE_WAYLAND = "1";
  };
}
