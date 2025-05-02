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
      extraPackages = with pkgs; [
        # amdvlk
        rocmPackages.clr.icd
        libva
        ocl-icd
      ];
    };

    environment.systemPackages = with pkgs; [
      vulkan-tools
      clinfo
      # mesa-demos
    ];
  };
}
