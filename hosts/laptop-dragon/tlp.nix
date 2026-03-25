{ ... }:

{
  services.tlp = {
    enable = true;
    
    /*
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "balanced";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "balanced";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

      # Helps save long term battery health
      START_CHARGE_THRESH_BAT1 = 75; # and below it starts to charge
      STOP_CHARGE_THRESH_BAT1 = 80; # and above it stops charging
    };
    */
  };
}
