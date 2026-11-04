{ ... }:

{
  wayland.windowManager.hyprland.extraConfig = ''
    local mainMod = "SUPER"
    local terminal = "kitty"
    local fileManager = "thunar"
    local ipc = "noctalia msg"

    -- Windows and applications.
    hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
    hl.bind(mainMod .. " + Q", hl.dsp.window.close())
    hl.bind(mainMod .. " + M", hl.dsp.exit())
    hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
    hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

    -- Noctalia.
    hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"))
    -- hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd(ipc .. " settings-toggle"))
    hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("noctalia msg plugin oldirtty/color_picker:service all pick"))
    -- hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd(ipc .. " plugin:screen-toolkit recordMp4"))
    -- hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd(ipc .. " plugin:screen-toolkit measure"))
    hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("noctalia msg panel-toggle noctalia/notes:panel"))

    -- Screenshots.
    hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("noctalia msg screenshot-region"))
    hl.bind("Print", hl.dsp.exec_cmd("noctalia msg screenshot-fullscreen"))

    -- Focus (left/right/up/down).
    hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
    hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
    hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
    hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

    -- Resize windows by 20 pixels per keystroke.
    hl.bind("CTRL + " .. mainMod .. " + left", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
    hl.bind("CTRL + " .. mainMod .. " + right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
    hl.bind("CTRL + " .. mainMod .. " + up", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
    hl.bind("CTRL + " .. mainMod .. " + down", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

    -- Workspaces 1-10.
    for workspace = 1, 10 do
      local key = tostring(workspace % 10)
      hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = tostring(workspace) }))
      hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = tostring(workspace) }))
    end

    -- Scratchpad.
    hl.bind(mainMod .. " + F", hl.dsp.workspace.toggle_special("magic"))
    hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.move({ workspace = "special:magic" }))

    -- Mouse dragging and resizing.
    hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
    hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

    -- Media keys: work while locked and repeat when held.
    local mediaFlags = { locked = true, repeating = true }
    hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. " volume-up 5"), mediaFlags)
    hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. " volume-down 5"), mediaFlags)
    hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. " brightness-up 5"), mediaFlags)
    hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. " brightness-down 5"), mediaFlags)
    hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. " volume-mute"), mediaFlags)

    -- Player controls with descriptions for hyprctl binds.
    hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { description = "Play next" })
    hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Play/pause" })
    hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Play/pause" })
    hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { description = "Previous track" })
  '';
}
