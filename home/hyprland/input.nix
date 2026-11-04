{ ... }:

{
  wayland.windowManager.hyprland.extraConfig = ''
    hl.config({
      input = {
        kb_layout = "pl",
        kb_variant = "",
        kb_options = "grp:alt_shift_toggle,compose:rctrl",
        touchpad = {
          natural_scroll = true,
          disable_while_typing = true,
          scroll_factor = 0.8,
        },
      },
    })

    hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
  '';
}
