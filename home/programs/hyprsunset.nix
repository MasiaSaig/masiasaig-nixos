{ ... }:

{
  services.hyprsunset = {
    enable = true;
    settings = {
      profile = [
        {
          time = "21:00";
          temperature = 5500;  # warm/orange tint at night
          gamma = 90;
        }
        {
          time = "08:00";
          temperature = 6500;  # neutral/daylight color
          gamma = 100;
        }
      ];
    };
  };
}