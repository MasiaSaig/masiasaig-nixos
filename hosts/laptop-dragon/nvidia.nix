{ config, lib, pkgs, ... }:
######
# FOR MORE VISITNG: nixos.wiki/wiki/nvidia
#######
{
  hardware.graphics.enable = true;

  # offloading - meaning, device will use integrated Intel GPU 
  # and use Nvidia one, only when specified with
  # >> nvidia-offload myAppToRun
  services.xserver.videoDrivers = [
    "modesetting" # use 'amdgpu' if your iGPU is AMD
    "nvidia"
  ];

  hardware.nvidia = {
    modesetting.enable = true;
    # Enable if having graphical corruption issues or application crashes after waking up from sleep. (experimental)
    powerManagement.enable = false;
    # Turns off GPU when not in use. (experimental)
    powerManagement.finegrained = false;
    
    # Use Nvidia open source kernel module
    open = false;
    
    # Enable Nvidia settings menu:
    # >> nvidia-settings
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      # Bus ID retrived from 'lshw' under *-display
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      # amdgpuBusId = "PCI@....';
    };
  };
}
