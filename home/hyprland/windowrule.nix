{ ... }:

{
  wayland.windowManager.hyprland.extraConfig = ''
    -- Ignore maximize requests from all windows.
    hl.window_rule({
      match = { class = ".*" },
      suppress_event = "maximize",
    })

    -- Do not focus empty XWayland utility windows.
    hl.window_rule({
      match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
      },
      no_focus = true,
    })
  '';
}
