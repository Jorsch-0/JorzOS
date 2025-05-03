{ pkgs, ... }:

{
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  gtk = {
    enable = true;

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    # theme = {
    #   package = pkgs.flat-remix-gtk;
    #   name = "Flat-Remix-GTK-Grey-Dark";
    # };
    theme = {
      package = (pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = ["blue"];
      });
      name = "catppuccin-mocha-blue-standard";
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };

    font = {
      name = "Inter";
      size = 10;
    };
  };
}
