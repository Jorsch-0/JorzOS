{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home/gtk.nix
    ../../modules/home/qt.nix
  ];

  # home.username = "jorsch";
  # home.homeDirectory = "/home/jorsch";

  # nixpkgs.config.allowUnfree = true;

  wayland.windowManager.hyprland.systemd.enable = false;

  programs.git = {
    userName = "Jorsch-0";
    userEmail = "jorge.leon@jortech.cc";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  home.stateVersion = "24.11"; # match your system version
}
