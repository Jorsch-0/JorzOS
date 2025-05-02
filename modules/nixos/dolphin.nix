{ config, lib, pkgs, ... }:

{
  # Enable XDG MIME and menu support
  # xdg.mime.enable = true;
  # xdg.menus.enable = true;

  # Fix for empty "Open With" menu in Dolphin when running under Hyprland
  # This copies the plasma-applications.menu file from plasma-workspace to /etc/xdg/menus/applications.menu
  environment.etc."/xdg/menus/applications.menu".text = builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  environment.systemPackages = with pkgs.kdePackages; [
    dolphin
    qtsvg
    kdegraphics-thumbnailers
    kio-admin
  #   ffmpegthumbs
  #   kservice
  #   kio-extras
  #   kde-cli-tools
  #   kio
  ];  

  # Additional KDE-specific packages
  # environment.systemPackages = with pkgs; [
    # Dolphin and required dependencies
    # kdePackages.dolphin
    # kdePackages.kio
    # kdePackages.kdf
    # kdePackages.kio-fuse
    # kdePackages.kio-extras
    # kdePackages.kio-admin
    # kdePackages.qtwayland
    # kdePackages.plasma-integration
    # kdePackages.kdegraphics-thumbnailers
    # kdePackages.breeze-icons
    # kdePackages.qtsvg
    # kdePackages.kservice
    # shared-mime-info
  # ];
}