{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rofi-wayland
    waybar
    swaynotificationcenter
    wlogout
    polkit_gnome
    waypaper
    swaybg
    vscode
    fzf
    zoxide
    neovim
    imv
    (mpv.override {scripts = [mpvScripts.mpris];}) # with tray
    gnome-font-viewer
    file-roller
    xdg-user-dirs
    fastfetch
    google-chrome
    pavucontrol
    pamixer
    playerctl
    insync
  ];
}
