{ config, pkgs, ... }:
let
  # steam-with-pkgs = pkgs.steam.override {
  #   extraPkgs = pkgs:
  #     with pkgs; [
  #       xorg.libXcursor
  #       xorg.libXi
  #       xorg.libXinerama
  #       xorg.libXScrnSaver
  #       libpng
  #       libpulseaudio
  #       libvorbis
  #       stdenv.cc.cc.lib
  #       libkrb5
  #       keyutils
  #     ];
  # };
in {
  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    # localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    package = pkgs.steam.override {
      # withPrimus = true;
      extraPkgs = pkgs: 
        with pkgs; [ 
          # bumblebee
          # glxinfo
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib
          libkrb5
          keyutils
        ];
    };
    # gamescopeSession.enable = true;
    extraCompatPackages = [pkgs.proton-ge-bin];
  };

  programs.gamemode.enable = true;
  programs.gamemode.settings.general.inhibit_screensaver = 0;

  # programs.gamescope = {
  #   enable = true;
  #   capSysNice = true;
  #   args = [
  #     "--rt"
  #     "--expose-wayland"
  #   ];
  # };

  environment.systemPackages = with pkgs; [
    # steam-with-pkgs
    # protontricks
    lutris
    winetricks
    wineWowPackages.stagingFull
    # protonup-qt
    mangohud
    gamescope
  ];
}