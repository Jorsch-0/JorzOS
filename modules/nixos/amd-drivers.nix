{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
let
  cfg = config.drivers.amdgpu;
in
{
  options.drivers.amdgpu = {
    enable = mkEnableOption "Enable AMD Drivers";
  };

  config = mkIf cfg.enable {
    systemd.tmpfiles.rules = [ "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}" ];
    # services.xserver.videoDrivers = [ "amdgpu" ];
    boot.initrd.kernelModules = [ "amdgpu" ];
    boot.kernel.sysctl = { "vm.max_map_count" = 2147483642; };
    
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    hardware.graphics = {
      extraPackages = with pkgs; [
        #libva
	      #libva-utils
        # amdvlk
        # rocmPackages_5.rocm-runtime
        # rocmPackages_5.rocminfo
        rocmPackages.clr.icd
        clinfo
      ];
    };
  };
}
