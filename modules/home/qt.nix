{ config, lib, pkgs, inputs, ... }:
let
  variant = "mocha";
  accent = "blue";
  kvantumThemePackage = pkgs.catppuccin-kvantum.override {
    inherit variant accent;
  };
in
{
  home.packages = with pkgs; [
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qt6ct
    # libsForQt5.qt5ct
  ];

  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    # style = {
    #   package = pkgs.catppuccin-kvantum;
    #   name = "kvantum";
    # };
    kde.settings.kdeglobals.General.TerminalApplication = "kitty";
    kde.settings.kdeglobals.Icons.Theme = config.gtk.iconTheme.name;
  };

  xdg.configFile."dolphinrc".text = ''
    [KFileDialog Settings]
    Places Icons Auto-resize=false
    Places Icons Static Size=22

    [MainWindow]
    MenuBar=Disabled

    [UiSettings]
    ColorScheme=*
  '';

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=catppuccin-${variant}-${accent}
    '';

    # The important bit is here, links the theme directory from the package to a directory under `~/.config`
    # where Kvantum should find it.
    "Kvantum/catppuccin-${variant}-${accent}".source = "${kvantumThemePackage}/share/Kvantum/catppuccin-${variant}-${accent}";
  };

  # xdg.configFile = {
  #   "Kvantum/ArcDark".source = "${pkgs.arc-kde-theme}/share/Kvantum/ArcDark";
  #   "Kvantum/kvantum.kvconfig".text = "[General]\ntheme=ArcDark";
  # };

  xdg.configFile = {
    # "Kvantum".source = ../../assets/Kvantum;
    # "Kvantum".recursive = true;
    "qt5ct".source = ../../assets/qt5ct;
    "qt5ct".recursive = true;
    "qt6ct".source = ../../assets/qt6ct;
    "qt6ct".recursive = true;
  };
  # home.file = {
  #   ".config/Kvantum" = {
  #     source = builtins.toPath ../../assets/Kvantum;
  #     recursive = true;
  #   };
  #   ".config/qt5ct".source = inputs.self + /assets/qt5ct;
  #   ".config/qt5ct".recursive = true;
  #   ".config/qt6ct".source = inputs.self + /assets/qt6ct;
  #   ".config/qt6ct".recursive = true;
  # };
}