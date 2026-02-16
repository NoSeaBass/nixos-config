{ config, pkgs, ... }:
{
  #For obsidian baby !
  nixpkgs.config.allowUnfree = true;

  # Install firefox.
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    tree
    fastfetch # Cause why not :D
    htop

    obsidian
    libreoffice
    vim
    git

    # For Programming
    jdk21
    python3
    gcc
    gnumake
    nodejs
    postgresql
    docker

    eclipses.eclipse-java
    #index-fm  #BOOHOOO!
    #ark

    vlc
  ];

  services.postgresql.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
