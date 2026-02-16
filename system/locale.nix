{ config, pkgs, ... }:
{
  # Set your time zone.
  time.timeZone = "Africa/Dakar";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "wo_SN";
    LC_IDENTIFICATION = "wo_SN";
    LC_MEASUREMENT = "wo_SN";
    LC_MONETARY = "wo_SN";
    LC_NAME = "wo_SN";
    LC_NUMERIC = "wo_SN";
    LC_PAPER = "wo_SN";
    LC_TELEPHONE = "wo_SN";
    LC_TIME = "wo_SN";
  };
}
