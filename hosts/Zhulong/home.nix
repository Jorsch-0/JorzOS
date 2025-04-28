{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home/hosts/Zhulong.nix
    ../../modules/home/gtk.nix
  ];

  home.username = "jorsch";
  home.homeDirectory = "/home/jorsch";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    home-manager
  ];

  wayland.windowManager.hyprland.systemd.enable = false;

  home.stateVersion = "24.11"; # match your system version
}
