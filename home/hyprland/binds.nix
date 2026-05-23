{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$terminal" = "kitty";
    "$fileManager" = "thunar";
    "$ipc" = "noctalia-shell ipc call";

    # Bind keyboard keysi
    "$mainMod" = "SUPER";
    "$mainMod_L" = "SUPER_L";

    bind = [
      "$mainMod, T, exec, $terminal"
      "$mainMod, Q, killactive"
      "$mainMod, M, exit"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, V, togglefloating"
      #"$mainMod, P, pseudo" # dwindle
      #"$mainMod, J, togglesplit" # dwindle

      # Noctalia
      "$mainMod, SPACE, exec, $ipc launcher toggle"
      "$mainMod, comma, exec, $ipc settings toggle"
      ## Screen Toolkig - plugin
      "$mainMod SHIFT, C, exec, $ipc plugin:screen-toolkit colorPicker"
      "$mainMod SHIFT, R, exec, $ipc plugin:screen-toolkit recordMp4"
      "$mainMod SHIFT, M, exec, $ipc plugin:screen-toolkit measure"
      
      # Screen shot
      "$mainMod SHIFT, S, exec, grim -g \"$(slurp -d)\" - | wl-copy"
      ", Print_L, exec, grim - | wl-copy"
      
      # Color picker
      # "$mainMod SHIFT, C, exec, $colorPicker -a -l"

      # Move focus with mainMod + arrow keys
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, d"
      "$mainMod, down, movefocus, u"

      # Resize windows
      "Ctrl+$mainMod, left, resizeactive, -20 0"
      "Ctrl+$mainMod, right, resizeactive, 20 0"
      "Ctrl+$mainMod, up, resizeactive, 0 20"
      "Ctrl+$mainMod, down, resizeactive, 0 -20"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      # Example special workspace (scratchpad)
      "$mainMod, F, togglespecialworkspace, magic"
      "$mainMod SHIFT, F, movetoworkspace, special:magic"

      #Scroll through existing workspaces with mainMod + scroll
      # "$mainMod, mouse_down, workspace, e+1"
      # "$mainMod, mouse_up, workspace, e-1"
    ];

    # Bind mouse
    bindm = [
      "$mainMod, mouse:272, movewindow"   # Move windows
      "$mainMod, mouse:273, resizewindow" # Resize windows
    ];

    # Bind laptop multimedia keys (volume, brightness, etc.)
    bindel = [
      ", XF86AudioRaiseVolume, exec, $ipc volume increase"
      ", XF86AudioLowerVolume, exec, $ipc volume decrease"
      ", XF86MonBrightnessUp, exec, $ipc brightness increase"
      ", XF86MonBrightnessDown, exec, $ipc brightness decrease"
      ", XF86AudioMute, exec, $ipc volume muteOutput"
      # ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      # ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      # ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      # ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      # ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
      # ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
    ];
        
    bindd = [
      # Requires playerctl
      ", XF86AudioNext, Play Next, exec, playerctl next"
      ", XF86AudioPause, Play Pause, exec, playerctl play-pause"
      ", XF86AudioPlay, Play Pause, exec, playerctl play-pause"
      ", XF86AudioPrev, Previous Track, exec, playerctl previous"
    ];

    /*bindl = {
      # Requires playerctl
      ", XF86AudioNext, Play Next, exec, playerctl next"
      ", XF86AudioPause, Play Pause, exec, playerctl play-pause"
      ", XF86AudioPlay, Play Pause, exec, playerctl play-pause"
      ", XF86AudioPrev, Previous Track, exec, playerctl previous"
    };*/
  };
}
