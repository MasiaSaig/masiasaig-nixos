{ ... }:

{
  wayland.windowManager.hyprland.extraConfig = ''
    hl.env("XCURSOR_SIZE", "16")
    hl.env("HYPRCURSOR_SIZE", "16")
    -- hl.env("TERMINAL", "kitty")
    -- hl.env("EDITOR", "nvim")
  '';
}
