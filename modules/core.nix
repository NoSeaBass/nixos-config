{ config, pkgs, ... }:

{
  # KDE Plasma
  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  services.desktopManager.plasma6.enable = true;

  # Clavier
  services.xserver.xkb = {
    layout = "us"; # Remplacez par "fr" si besoin
    variant = "intl";
  };

  console.keyMap = "us";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Réseau
  networking.hostName = "nixos";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  networking.networkmanager.enable = true;

  # Blueatooth - List services that you want to enable:
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Localisation et Fuseau Horaire
  time.timeZone = "Africa/Dakar";
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

  # Audio (Pipewire)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  # If you want to use JACK applications, uncomment this
  #jack.enable = true;

  # use the example session manager (no others are packaged yet so this is enabled by default,
  # no need to redefine it in your config for now)
  #media-session.enable = true;

  # Gestion de l'énergie et Batterie
  services.power-profiles-daemon.enable = false;
  services.thermald.enable = true;
  # If like in the past my fans ends running more when unpluged and the oposite happens when it's plugged :
  services.tlp = {
    enable = true;
    settings = {
      TLP_DEFAULT_MODE = "BAT";
      TLP_PERSISTENT_DEFAULT = 1;
    };
  };

  # SSH
  programs.ssh.startAgent = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
}
