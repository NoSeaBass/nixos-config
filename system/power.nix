{ config, pkgs, ... }:
{
    # Battery

    # Disable power-profiles-daemon (conflicts with TLP)
    services.power-profiles-daemon.enable = false;

    services.thermald.enable = true;

    services.tlp={
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

       #Optional helps save long term battery health
       START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
       STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

      };
    };

    # If like in the past my fans ends running more when unpluged and the oposite happens when it's plugged :
    #services.tlp = {
    #  enable = true;
    #  settings = {
    #    TLP_DEFAULT_MODE = "BAT";
    #    TLP_PERSISTENT_DEFAULT = 1;
    #  };
    # };
}
