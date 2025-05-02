{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    # withUWSM = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kitty
  ];

  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  #   configPackages = [pkgs.hyprland];
  # };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
