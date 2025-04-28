{ config, lib, pkgs, ... }:

{
  services = {
    dbus.enable = true;
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
  };
}