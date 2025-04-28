{ config, lib, pkgs, ... }:

{
  services.greetd = {
    enable = true; # also enable UWSM!
    # vt = 1; # tty -- default 1
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -t -r --remember-session";
        user = "greeter"; # NOT a username
      };
    };
  };
}
