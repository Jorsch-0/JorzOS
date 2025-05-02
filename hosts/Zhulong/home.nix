{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/home/gtk.nix
    ../../modules/home/qt.nix
  ];

  # home.username = "jorsch";
  # home.homeDirectory = "/home/jorsch";

  # nixpkgs.config.allowUnfree = true;

  # wayland.windowManager.hyprland.systemd.enable = false;

  home.stateVersion = "24.11"; # match your system version
}
