# Configuration NixOS Modulaire

Ce dépôt contient les fichiers de configuration de mon système NixOS. L'architecture a été simplifiée et organisée de manière modulaire pour être facile à maintenir et à faire évoluer.

## 📁 Structure du Projet

L'ensemble de la configuration est centralisé autour d'un fichier principal et de trois grands modules thématiques :

```text
.
├── configuration.nix         # Point d'entrée principal du système
├── hardware-configuration.nix # Configuration matérielle (générée automatiquement)
└── modules
    ├── core.nix             # Base du système (Boot, Réseau, Audio, Énergie)
    ├── desktop.nix          # Environnement graphique (Serveur X, KDE Plasma)
    └── users.nix            # Utilisateur, Applications et Environnement de Dev
