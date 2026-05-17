{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    input = 
    {
      kb_layout = "pl";
      kb_variant = "";
      kb_options = [
        "grp:alt_shift_toggle"
	      "compose:rctrl"
      ];
      # repeat_delay = 300;
      # follow_mouse = 1;
      # sensitivity = 0;

      # touchpad = {
      #   natural_scroll = true;
      #   disable_while_typing = true;
      #   scroll_factor = 0.8;
      # };
    };

    guestures = {
      gesture = ["3, horizontal, workspace"];
    };
  };
}
