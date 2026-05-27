{ config, pkgs, ... }:

{
  # Configuration de Nixpkgs (Autorisations et Licences)
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.android_sdk.accept_license = true;

  # Compte Utilisateur
  users.users.ibra = {
    isNormalUser = true;
    description = "Papa Ibrahima Diop";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # Mon bash
  programs.bash = {
      enable = true;
      interactiveShellInit = ''
        #clear
        #figlet -f big "Run It !" | lolcat
      '';
      #cat ~/.dragon
    };

  # Programmes de base du système
  programs.firefox.enable = true;
  programs.dconf.enable = true;
  programs.virt-manager.enable = true;

  # Liste des paquets installés sur le système
  environment.systemPackages = with pkgs; [
    # Outils Système et Terminal
    wget
    tree
    fastfetch
    btop
    nh
    zoxide
    clipboard-jh
    nix-tree
    alejandra

    # Divertissement et Petits Jeux
    ani-cli
    vitetris
    dwarf-fortress
    figlet
    lolcat
    sl
    ppsspp
    vlc

    # Bureautique et Prise de notes
    obsidian
    libreoffice
    zotero
    drawio
    #teams-for-linux

    # Développement (Langages et Outils)
    neovim
    git
    gcc
    gnumake
    python3
    nodejs
    ruby
    jekyll
    jdk21
    dbeaver-bin
    sqlite
    postgresql
    docker
    texliveFull

    # IDEs et Utilitaires Dev
    vscode-fhs
    android-studio
    eclipses.eclipse-java
    sqlitebrowser
    postman
    xmlstarlet

    # Virtualisation (QEMU / Spices)
    virt-manager
    virt-viewer
    motrix
    spice
    spice-gtk
    spice-protocol
    virtio-win
    win-spice

    lunar-client
  ];

  # Configuration de la Virtualisation
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        vhostUserPackages = [ pkgs.virtiofsd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };

  services.spice-vdagentd.enable = true;

  services.mysql = {
      enable = true;
      package = pkgs.mysql80;
  };

  services.postgresql = {
      enable = true;
      authentication = pkgs.lib.mkOverride 10 ''
      local all all peer

      host all all 127.0.0.1/32 trust
      host all all ::1/128 trust
      '';
  };
}
