{ ... }:

{
  imports = [
    ./animation.nix
    ./binds.nix
    ./decoration.nix
    ./env.nix
    ./input.nix
    ./windowrule.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";

    # Use the same Hyprland and XDPH binaries as the NixOS module.
    package = null;
    portalPackage = null;

    # Home Manager writes this Lua to ~/.config/hypr/hyprland.lua.
    extraConfig = ''
      -- Laptop on the left, external monitor on the right.
      hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 1 })
      hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "auto-right", scale = 1 })

      hl.config({
        general = {
          gaps_out = 8,
          resize_on_border = true,
          layout = "dwindle",
        },
        dwindle = {
          preserve_split = true,
        },
        misc = {
          force_default_wallpaper = 0,
          disable_hyprland_logo = true,
        },
        ecosystem = {
          no_donation_nag = true,
          no_update_news = false,
        },
      })

      -- Prefer the NVIDIA device
      hl.env("AQ_DRM_DEVICES", "/dev/dri/nvidia-dgpu:/dev/dri/intel-igpu")

      -- Startup
      hl.on("hyprland.start", function()
        hl.exec_cmd("noctalia")
        hl.exec_cmd("vesktop")
      end)
    '';
  };
}
